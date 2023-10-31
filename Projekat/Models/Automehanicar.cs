using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Automehanicar
{
    public int RadnikId { get; set; }

    public virtual ICollection<Obucen> Obucens { get; set; } = new List<Obucen>();

    public virtual Radnik Radnik { get; set; } = null!;
}
