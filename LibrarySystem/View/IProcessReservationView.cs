﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VirtualCollege.View
{
    public interface IProcessReservationView
    {
        object Reservations {set;}
        string SelectedReservationId { get; }
        Mode SelectedMode { get; }

        event EventHandler switchMode;
        event EventHandler processReservation;
        event EventHandler cancelReservation;

        void DisplayMessage(string message);
    }

    public enum Mode
    {
        Todo,
        History
    }
}
