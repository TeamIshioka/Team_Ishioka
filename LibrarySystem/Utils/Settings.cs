﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualCollege.Utils
{
    public static class Settings
    {
        public enum ItemType
        {
            Book,
            Ebook,
            Disc,
            Room,
            Pc
        }
        public enum ReserveStatus
        {
            Pending,
            Processed,
            Close,
            Cancel
        }

        public static const string Invalid_BookType = "book type is invalid";
        public static const string Invalid_a = "";
    }
}