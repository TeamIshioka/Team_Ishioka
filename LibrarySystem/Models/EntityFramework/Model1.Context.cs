﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VirtualCollege.Models.EntityFramework
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class LibraryDBEntities : DbContext
    {
        public LibraryDBEntities()
            : base("name=LibraryDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Book> Books { get; set; }
        public DbSet<Disc> Discs { get; set; }
        public DbSet<Ebook> Ebooks { get; set; }
        public DbSet<IssueBook> IssueBooks { get; set; }
        public DbSet<IssueDisc> IssueDiscs { get; set; }
        public DbSet<IssueEbook> IssueEbooks { get; set; }
        public DbSet<Librarian> Librarians { get; set; }
        public DbSet<Manager> Managers { get; set; }
        public DbSet<Member> Members { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<PC> PCs { get; set; }
        public DbSet<Reservation> Reservations { get; set; }
        public DbSet<ReservePC> ReservePCs { get; set; }
        public DbSet<ReserveRoom> ReserveRooms { get; set; }
        public DbSet<Room> Rooms { get; set; }
    }
}