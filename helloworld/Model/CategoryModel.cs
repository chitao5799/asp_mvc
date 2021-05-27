using Model.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Model
{
    public class CategoryModel
    {
        private OnlineShopDbContext context = null;

        public CategoryModel()
        {
            context = new OnlineShopDbContext();
        }

        public List<Category> ListAll()
        {
            var list = context.Database.SqlQuery<Category>("Sp_Category_ListAll").ToList();
            return list;
        }

        public int Create(string name, string alias, int? parentId, int? order, bool? status)
        {
            object[] parameters = 
            {
                new SqlParameter("@name",name),
                new SqlParameter("@Alias", alias),
                new SqlParameter("@ParentID", parentId),
                new SqlParameter("@Order", order),
                new SqlParameter("@Status", status),
            };
            int res = context.Database.ExecuteSqlCommand("Sp_Category_Insert @name,@Alias,@ParentID,@Order,@Status", parameters);
            return res;
        }
    }
}
