using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.Dao
{
    public class UserDao
    {
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
        public int Login(string userName, string password)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result ==null)
            {
                return 0;//tài khoản không tồn tại
            }
            else
            {
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
        public IEnumerable<User> ListAllPaging(int page, int pageSize)
        {
            return db.Users.OrderByDescending(x=>x.CreateDate).ToPagedList(page,pageSize);
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
    }
}
