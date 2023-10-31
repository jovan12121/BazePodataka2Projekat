using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Mesto
{
    public int MestoId { get; set; }

    public string PostanskiBroj { get; set; } = null!;

    public string Naziv { get; set; } = null!;

    public virtual ICollection<Radnik> Radniks { get; set; } = new List<Radnik>();

    public virtual ICollection<Servi> Servis { get; set; } = new List<Servi>();

    public virtual ICollection<Vlasnik> Vlasniks { get; set; } = new List<Vlasnik>();
}
