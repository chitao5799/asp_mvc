using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using Common;

namespace Model.Dao
{
    public class UserDao
    {
        /// <summary>
        ///Dùng Linq để thao tác với db
        /// </summary>
        OnlineShopDbContext db = null;

        public UserDao()
        {
            db = new OnlineShopDbContext();
        }

        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();/*id trong db là tự tăng. entity truyền vào có id là 0 -  mặc định vì chưa set ở đối số truyền vào.
                            Sau khi chạy xong hàm SaveChanges() thì entity có id có giá trị tự tăng của bản ghi ở trong db*/
            return entity.ID;
        }

        public long InsertForFacebook(User entity)
        {
            var user = db.Users.SingleOrDefault(x => x.UserName == entity.UserName);
            if (user == null) 
            {
                    db.Users.Add(entity);
                    db.SaveChanges();
                    return entity.ID;
            }
            else
            {
                return user.ID;
            }
        }

        public bool Update(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.ID);
                user.Name = entity.Name;
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.Phone = entity.Phone;
                user.ModifiedBy = entity.ModifiedBy;
                user.ModifiedDate = DateTime.Now;
                user.Status = entity.Status;
                db.SaveChanges();
                return true;
            }catch(Exception)
            {
                //logging
                return false;
            }
        }

        public User ViewDetail(int id)
        {
            return db.Users.Find(id);
        }

        public User GetByID(string userName)
        {
            return db.Users.SingleOrDefault(x=>x.UserName==userName);
        }

        public bool CheckExistEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) >0;
        }

        public List<string> GetListCredential(string userName)
        {
            var user = db.Users.Single(x => x.UserName == userName);
            var data = (from a in db.Credentials
                       join b in db.UserGroups on a.UserGroupID equals b.ID
                       join c in db.Roles on a.RoleID equals c.ID
                       where b.ID==user.GroupID
                       select new
                     {
                         RoleID=a.RoleID,
                         UserGroupID=a.UserGroupID
                     }).AsEnumerable().Select(x=> new Credential() {
                         RoleID=x.RoleID,
                         UserGroupID=x.UserGroupID
                     });
            return data.Select(x=>x.RoleID).ToList();
        }

        public int Login(string userName, string password, bool isLoginAdmin=false)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result ==null)
            {
                return 0;//tài khoản không tồn tại
            }
            else
            {
                if (isLoginAdmin == true)
                {
                    if (!(result.GroupID == CommonContrants.ADMIN_GROUP || result.GroupID == CommonContrants.MOD_GROUP))
                    {
                        return -3;
                    }
                }
                if (result.Status == false)
                {
                    return -1; //tài khoản bị khóa
                }
                else
                {
                    if (result.Password == password)
                        return 1;//đăng nhập thành công
                    else
                        return -2; //sai mật khẩu
                }
            }
            
        }
        public IEnumerable<User> ListAllPaging(string searchString, int page, int pageSize)
        {
            //var _pageSize = Int32.Parse(ConfigurationManager.AppSettings["pageSize"].ToString()); //cách lấy ở file Web.config trong thẻ <appSettings>

            IQueryable<User> model = db.Users;
            if (!string.IsNullOrEmpty(searchString))
            {
                //Contains là tìm kiếm gần đúng, câu lệnh này sẽ sinh ra câu lệnh select
                model = model.Where(x => x.UserName.Contains(searchString) || x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page,pageSize);
        }

        public bool Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                db.Users.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                
                return false;
            }

        }

        public bool ChangeStatus(long id)
        {
            var user = db.Users.Find(id);
            user.Status = !user.Status;
            db.SaveChanges();
            return !user.Status;
        }
    }
}
