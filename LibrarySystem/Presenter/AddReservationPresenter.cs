﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VirtualCollege.Models;
using VirtualCollege.Models.Entity;
using VirtualCollege.UserControls;
using VirtualCollege.Utils;
using VirtualCollege.View;

namespace VirtualCollege.Presenter
{
    public class AddReservationPresenter : IAddReservationPresenter
    {
        private IAddReservationView view;
        private IReservationModel model;

        public AddReservationPresenter(IAddReservationView view, IReservationModel model)
        {
            this.view = view;
            this.model = model;
            this.view.placeHoldHandler += Reserve;
        }

        private void Reserve(object sender, EventArgs e)
        {
            Reservation reservation = new Reservation();
            reservation.itemType = view.ItemType;
            reservation.itemId = view.ItemId;
            reservation.userId = view.UserId;
            reservation.expireDate = view.ExpireDate;
            reservation.processDate = Settings.Default_Reservation_Date;
            reservation.pickupDate = Settings.Default_Reservation_Date;
            reservation.status = view.Status.ToString();
            this.AddReservation(reservation);
            view.Status = VirtualCollege.Utils.Settings.ReserveStatus.Pending;            
        }

        public void AddReservation(Models.Entity.Reservation reservation)
        {
            model.AddReservation(reservation);
        }



        public Models.EntityFramework.Book GetBook(string bookId)
        {
            return model.GetBookById(bookId);
        }

        public Models.EntityFramework.Ebook GetEbook(string ebookId)
        {
            return model.GetEbookById(ebookId);
        }

        public Models.EntityFramework.Disc getDisc(string discId)
        {
            return model.GetDiscById(discId);
        }

        public Models.EntityFramework.Room getRoom(string roomId)
        {
            return model.GetRoomById(roomId);
        }

        public Models.EntityFramework.PC getPc(string pcId)
        {
            return model.getPcById(pcId);
        }
    }
}