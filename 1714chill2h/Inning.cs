//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714chill2h
{
    using System;
    using System.Collections.Generic;
    
    public partial class Inning
    {
        public int Id { get; set; }
        public string Team1Score { get; set; }
        public string Team2Score { get; set; }
    
        public virtual Game Game { get; set; }
    }
}