using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.ViewModel;

namespace Model.Dao
{
    public class ProductDao
    {
        OnlineShopDbContext db = null;

        public ProductDao()
        {
            db = new OnlineShopDbContext();
        }

        public List<Product> ListNewProduct(int top)
        {
            return db.Products.OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListFeatureProduct(int top)
        {
            return db.Products.Where(x => x.TopHot != null && x.TopHot > DateTime.Now).OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListRelateProduct(long productId)
        {
            var product = db.Products.Find(productId);
            return db.Products.Where(x => x.ID != productId && x.CategoryID == product.CategoryID).OrderByDescending(x => x.CreateDate).ToList();
        }

        public Product ViewDetail(long id)
        {
            return db.Products.Find(id);
        }

        /// <summary>
        /// get list product by category id
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public List<Product> ListByCategoryID(long categoryId, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        //public List<ProductViewModel> ListByCategoryID(long categoryId, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Products.Where(x => x.CategoryID == categoryId).Count();
            return db.Products.Where(x => x.CategoryID == categoryId).OrderByDescending(x => x.CreateDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();

            //cách 2 dùng cách join bảng - nhưng chưa phân trang được
            //totalRecord = db.Products.Where(x => x.CategoryID == categoryId).Count();
            //var model = from a in db.Products
            //            join b in db.ProductCategories
            //            on a.CategoryID equals b.ID
            //            where a.CategoryID == categoryId
            //            select new ProductViewModel()
            //            {
            //                CateMetaTitle = b.MataTitle,
            //                CateName = b.Name,
            //                CreatedDate = a.CreateDate,
            //                ID = a.ID,
            //                Images = a.Image,
            //                Name = a.Name,
            //                MetaTitle = a.MataTitle,
            //                Price = a.Price
            //            };
            //model.OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            //return model.ToList();
        }

        public List<string> ListNam(string keyword)
        {
            return db.Products.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }

        public List<Product> Search(string keyword, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Products.Where(x => x.Name.Contains(keyword)).Count();
            return db.Products.Where(x => x.Name.Contains(keyword)).OrderByDescending(x => x.CreateDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }
    }
}
