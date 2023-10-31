using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class MesecniIzvestaj
{
    public int Mesec { get; set; }

    public int Godina { get; set; }

    public decimal Prihodi { get; set; }

    public decimal Troskovi { get; set; }

    public decimal Saldo { get; set; }

    public decimal UkupniSaldo { get; set; }

    public int RadnikId { get; set; }

    public virtual Racunovodja Radnik { get; set; } = null!;
}
