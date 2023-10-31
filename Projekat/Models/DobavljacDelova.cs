using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class DobavljacDelova
{
    public int DobavljacId { get; set; }

    public string Naziv { get; set; } = null!;

    public string VrstaDelova { get; set; } = null!;

    public virtual ICollection<Servi> Servis { get; set; } = new List<Servi>();
}
