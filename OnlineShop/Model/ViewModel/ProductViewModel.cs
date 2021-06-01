using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{

    /// <summary>
    /// ví dụ về class entity chứa dữ liệu được join từ nhiều bảng
    /// tên các thuộc tính của class phải giống(hình như có thể không cần giống) với tên cột và cả giống về kiểu dữ liệu nữa
    /// </summary>
   public class ProductViewModel
    {
        public long ID { get; set; }
        public string Images { get; set; }
        public string Name { get; set; }
        public decimal? Price { set; get; }
        public string CateName { get; set; }
        public string CateMetaTitle { get; set; }
        public string MetaTitle { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
