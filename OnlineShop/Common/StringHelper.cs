using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Common
{
    public class StringHelper
    {
        /// <summary>
        /// chuyển chuỗi có dấu sang không dấu
        /// </summary>
        /// <param name="input">chuỗi có thể có dấu</param>
        /// <returns></returns>
        public static string ToUnsignString(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return null;
            }

            input = input.Trim();
            for (int i = 0x20; i < 0x30; i++)
            {
                input = input.Replace(((char)i).ToString(), " ");
            }
            input = input.Replace(".", "_");
            input = input.Replace(" ", "_");
            input = input.Replace(",", "_");
            input = input.Replace(";", "_");
            input = input.Replace(":", "_");
            input = input.Replace("  ", "_");
            Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
            string str = input.Normalize(NormalizationForm.FormD);
            string str2 = regex.Replace(str, string.Empty).Replace('đ', 'd').Replace('Đ', 'D');
            while (str2.IndexOf("?") >= 0)
            {
                str2 = str2.Remove(str2.IndexOf("?"), 1);
            }
            while (str2.Contains("--"))
            {
                str2 = str2.Replace("--", "-").ToLower();
            }
            return str2;
        }
    }
}
