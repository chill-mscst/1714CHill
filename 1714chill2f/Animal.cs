//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714chill2f
{
    using System;
    using System.Collections.Generic;
    
    public partial class Animal
    {
        public int Id { get; set; }
        public string AnimalName { get; set; }
        public System.DateTime BirthDate { get; set; }
        public string Description { get; set; }
    
        public virtual AnimalType AnimalType { get; set; }
        public virtual Person Person { get; set; }
    }
}
