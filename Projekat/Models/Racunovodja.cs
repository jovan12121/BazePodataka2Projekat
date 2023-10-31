using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Racunovodja
{
    public int RadnikId { get; set; }

    public virtual ICollection<MesecniIzvestaj> MesecniIzvestajs { get; set; } = new List<MesecniIzvestaj>();

    public virtual Radnik Radnik { get; set; } = null!;
}
