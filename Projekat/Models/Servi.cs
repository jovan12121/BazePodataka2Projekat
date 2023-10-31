using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Servi
{
    public int ServisId { get; set; }

    public string Adresa { get; set; } = null!;

    public int GodinaOsnivanja { get; set; }

    public int MestoId { get; set; }

    public virtual Mesto Mesto { get; set; } = null!;

    public virtual ICollection<Radnik> Radniks { get; set; } = new List<Radnik>();

    public virtual ICollection<DobavljacDelova> Dobavljacs { get; set; } = new List<DobavljacDelova>();
}
