using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Dovezen
{
    public int DovezenId { get; set; }

    public int AutomobilId { get; set; }

    public int VrstaPopravkeId { get; set; }

    public virtual Automobil Automobil { get; set; } = null!;

    public virtual ICollection<Popravka> Popravkas { get; set; } = new List<Popravka>();

    public virtual VrstaPopravke VrstaPopravke { get; set; } = null!;
}
