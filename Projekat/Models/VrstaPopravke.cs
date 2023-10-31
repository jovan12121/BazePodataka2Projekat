using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class VrstaPopravke
{
    public int VrstaPopravkeId { get; set; }

    public string Naziv { get; set; } = null!;

    public virtual Dovezen? Dovezen { get; set; }

    public virtual Obucen? Obucen { get; set; }
}
