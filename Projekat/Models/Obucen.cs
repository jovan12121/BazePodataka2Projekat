using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Obucen
{
    public int ObucenId { get; set; }

    public int RadnikId { get; set; }

    public int VrstaPopravkeId { get; set; }

    public virtual ICollection<Popravka> Popravkas { get; set; } = new List<Popravka>();

    public virtual Automehanicar Radnik { get; set; } = null!;

    public virtual VrstaPopravke VrstaPopravke { get; set; } = null!;
}
