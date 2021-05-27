using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Framework;


namespace Model
{
    public class AccountModel
    {
        private OnlineShopDbContext context = null;

        public AccountModel()
        {
            context = new OnlineShopDbContext();
        }

        public bool Login(string username, string password)
        {
            object[] sqlParams =
            {
                new SqlParameter("@username",username),
                new SqlParameter("@password",password)
            };
            var res = context.Database.SqlQuery<int>("Sp_account_login @username,@password", sqlParams).SingleOrDefault();
            if (res == 1)
                return true;
            else
            return false;
        }

    }
}
