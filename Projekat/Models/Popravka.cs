using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Popravka
{
    public DateTime Datum { get; set; }

    public decimal Cena { get; set; }

    public int DovezenId { get; set; }

    public int ObucenId { get; set; }

    public virtual Dovezen Dovezen { get; set; } = null!;

    public virtual Obucen Obucen { get; set; } = null!;
}
