using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using PagedList;

namespace Model.Dao
{
    public class ContentDao
    {
        OnlineShopDbContext db = null;

        public ContentDao()
        {
            db = new OnlineShopDbContext();
        }

        public Content GetByID(long id)
        {
            return db.Contents.Find(id);
        }

        public long Create(Content content)
        {
            //xử lý alias
            if (string.IsNullOrEmpty(content.MataTitle))
            {
                content.MataTitle = StringHelper.ToUnsignString(content.Name);
            }

            content.CreateDate = DateTime.Now;
            content.ViewCount = 0;

            db.Contents.Add(content);
            db.SaveChanges();

            //xử lý tags
            if (!string.IsNullOrEmpty(content.Tags))
            {
                string[] tags = content.Tags.Split(',');
                foreach(var tag in tags)
                {
                    var tagId = StringHelper.ToUnsignString(tag);
                    var existTag = this.CheckExistTag(tagId);
                    if (!existTag)
                    {
                        this.InsertTag(tagId, tag);
                    }

                    this.InsertContentTag(content.ID, tagId);

                }
            }
            return content.ID;
        }

        public long Edit(Content content)
        {
            Content entity = this.GetByID(content.ID);
            //xử lý alias
            if (string.IsNullOrEmpty(content.MataTitle))
            {
                entity.MataTitle = StringHelper.ToUnsignString(content.Name);
            }
            else
            {
                entity.MataTitle = content.MataTitle;
            }

            entity.ModifiedDate = DateTime.Now;
            entity.Detail = content.Detail;
            //....
            db.SaveChanges();

            //xử lý tags
            if (!string.IsNullOrEmpty(content.Tags))
            {
                this.RemoveAllContentTag(content.ID);
                string[] tags = content.Tags.Split(',');
                foreach (var tag in tags)
                {
                    var tagId = StringHelper.ToUnsignString(tag);
                    var existTag = this.CheckExistTag(tagId);
                    if (!existTag)
                    {
                        this.InsertTag(tagId, tag);
                    }

                    this.InsertContentTag(content.ID, tagId);

                }
            }
            return content.ID;
        }

        public void RemoveAllContentTag(long contentId)
        {
            db.ContentTags.RemoveRange(db.ContentTags.Where(x => x.ContentID == contentId));
            db.SaveChanges();
        }
        public bool CheckExistTag(string id)
        {
            return db.Tags.Count(x => x.ID == id) > 0;
        }

        public void InsertTag(string id, string name)
        {
            var tag = new Tag();
            tag.ID = id;
            tag.Name = name;
            db.Tags.Add(tag);
            db.SaveChanges();
        }

        public void InsertContentTag(long contentId,string tagId)
        {
            var contentTag = new ContentTag();
            contentTag.ContentID = contentId;
            contentTag.TagID = tagId;
            db.ContentTags.Add(contentTag);
            db.SaveChanges();
        }

        public IEnumerable<Content> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Content> model = db.Contents;
            if (!string.IsNullOrEmpty(searchString))
            {
                //Contains là tìm kiếm gần đúng, câu lệnh này sẽ sinh ra câu lệnh select
                model = model.Where(x => x.Name.Contains(searchString) || x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public IEnumerable<Content> ListAllPaging( int page, int pageSize, ref int totalRecord)
        {
            totalRecord = db.Contents.Count();
            IQueryable<Content> model = db.Contents;
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public IEnumerable<Content> ListAllByTag(string tagId, int page, int pageSize, ref int totalRecord)
        {
            var model = (from a in db.Contents
                         join b in db.ContentTags
                         on a.ID equals b.ContentID
                         where b.TagID==tagId
                         select new
                         {
                             Name=a.Name,
                             MetaTitle=a.MataTitle,
                             Image=a.Image,
                             Description=a.Description,
                             CreateDate=a.CreateDate,
                             CreageBy=a.CreateBy,
                             Id=a.ID
                         }).AsEnumerable().Select(x => new Content()
                         {
                             Name=x.Name,
                             MataTitle=x.MetaTitle,
                             Image=x.Image,
                             Description=x.Description,
                             CreateDate=x.CreateDate,
                             CreateBy=x.CreageBy,
                             ID=x.Id
                         });
            totalRecord = model.Count();
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public Tag GetTag(string tagid)
        {
            return db.Tags.Find(tagid);
        }

        public List<Tag> ListTag(long contentId)
        {
            var model = (from a in db.Tags
                         join b in db.ContentTags
                         on a.ID equals b.TagID
                         where b.ContentID == contentId
                         select new
                         {
                             ID = b.TagID,
                             Name = a.Name
                         }).AsEnumerable().Select(x => new Tag()
                         {
                             ID = x.ID,
                             Name = x.Name
                        });
            return model.ToList();
        }
    }
}
