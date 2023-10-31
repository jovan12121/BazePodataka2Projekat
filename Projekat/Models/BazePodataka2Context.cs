using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Projekat.Models;

public partial class BazePodataka2Context : DbContext
{
    public BazePodataka2Context()
    {
    }

    public BazePodataka2Context(DbContextOptions<BazePodataka2Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Automehanicar> Automehanicars { get; set; }

    public virtual DbSet<Automobil> Automobils { get; set; }

    public virtual DbSet<DobavljacDelova> DobavljacDelovas { get; set; }

    public virtual DbSet<Dovezen> Dovezens { get; set; }

    public virtual DbSet<MesecniIzvestaj> MesecniIzvestajs { get; set; }

    public virtual DbSet<Mesto> Mestos { get; set; }

    public virtual DbSet<Obucen> Obucens { get; set; }

    public virtual DbSet<Popravka> Popravkas { get; set; }

    public virtual DbSet<Racunovodja> Racunovodjas { get; set; }

    public virtual DbSet<Radnik> Radniks { get; set; }

    public virtual DbSet<Servi> Servis { get; set; }

    public virtual DbSet<Vlasnik> Vlasniks { get; set; }

    public virtual DbSet<VrstaPopravke> VrstaPopravkes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DESKTOP-0OTVUN6\\SQLEXPRESS;Database=BazePodataka2;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Automehanicar>(entity =>
        {
            entity.HasKey(e => e.RadnikId).HasName("PK__Automeha__ABC4C73A7B73F5CA");

            entity.ToTable("Automehanicar");

            entity.Property(e => e.RadnikId).ValueGeneratedNever();

            entity.HasOne(d => d.Radnik).WithOne(p => p.Automehanicar)
                .HasForeignKey<Automehanicar>(d => d.RadnikId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Automehan__Radni__4BAC3F29");
        });

        modelBuilder.Entity<Automobil>(entity =>
        {
            entity.HasKey(e => e.AutomobilId).HasName("PK__Automobi__BCB35E635B7CC406");

            entity.ToTable("Automobil");

            entity.Property(e => e.BrojSasije)
                .HasMaxLength(17)
                .IsUnicode(false);
            entity.Property(e => e.Model)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Proizvodjac)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Vlasnik).WithMany(p => p.Automobils)
                .HasForeignKey(d => d.VlasnikId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Automobil__Vlasn__44FF419A");
        });

        modelBuilder.Entity<DobavljacDelova>(entity =>
        {
            entity.HasKey(e => e.DobavljacId).HasName("PK__Dobavlja__DE87BE399F343E5F");

            entity.ToTable("DobavljacDelova");

            entity.Property(e => e.Naziv)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VrstaDelova)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Dovezen>(entity =>
        {
            entity.HasKey(e => e.DovezenId).HasName("PK__Dovezen__B9E80C1624BC600F");

            entity.ToTable("Dovezen");

            entity.HasIndex(e => e.VrstaPopravkeId, "Dovezen_Automobil_VrstaP").IsUnique();

            entity.HasOne(d => d.Automobil).WithMany(p => p.Dovezens)
                .HasForeignKey(d => d.AutomobilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Dovezen__Automob__5BE2A6F2");

            entity.HasOne(d => d.VrstaPopravke).WithOne(p => p.Dovezen)
                .HasForeignKey<Dovezen>(d => d.VrstaPopravkeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Dovezen__VrstaPo__5CD6CB2B");
        });

        modelBuilder.Entity<MesecniIzvestaj>(entity =>
        {
            entity.HasKey(e => new { e.Mesec, e.Godina, e.RadnikId }).HasName("PK__MesecniI__B5F81AB14364B4BE");

            entity.ToTable("MesecniIzvestaj");

            entity.Property(e => e.Prihodi).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Saldo).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Troskovi).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.UkupniSaldo).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Radnik).WithMany(p => p.MesecniIzvestajs)
                .HasForeignKey(d => d.RadnikId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__MesecniIz__Radni__5165187F");
        });

        modelBuilder.Entity<Mesto>(entity =>
        {
            entity.HasKey(e => e.MestoId).HasName("PK__Mesto__31B86D2A2F078FF7");

            entity.ToTable("Mesto");

            entity.Property(e => e.Naziv)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PostanskiBroj)
                .HasMaxLength(10)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Obucen>(entity =>
        {
            entity.HasKey(e => e.ObucenId).HasName("PK__Obucen__46696B865C9536A1");

            entity.ToTable("Obucen");

            entity.HasIndex(e => e.VrstaPopravkeId, "Obucen_Automehanicar_VrstaP").IsUnique();

            entity.HasOne(d => d.Radnik).WithMany(p => p.Obucens)
                .HasForeignKey(d => d.RadnikId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Obucen__RadnikId__571DF1D5");

            entity.HasOne(d => d.VrstaPopravke).WithOne(p => p.Obucen)
                .HasForeignKey<Obucen>(d => d.VrstaPopravkeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Obucen__VrstaPop__5812160E");
        });

        modelBuilder.Entity<Popravka>(entity =>
        {
            entity.HasKey(e => new { e.Datum, e.DovezenId, e.ObucenId }).HasName("PK__Popravka__4326EE2E39D58C9E");

            entity.ToTable("Popravka");

            entity.Property(e => e.Datum).HasColumnType("date");
            entity.Property(e => e.Cena).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Dovezen).WithMany(p => p.Popravkas)
                .HasForeignKey(d => d.DovezenId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Popravka__Doveze__5FB337D6");

            entity.HasOne(d => d.Obucen).WithMany(p => p.Popravkas)
                .HasForeignKey(d => d.ObucenId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Popravka__Obucen__60A75C0F");
        });

        modelBuilder.Entity<Racunovodja>(entity =>
        {
            entity.HasKey(e => e.RadnikId).HasName("PK__Racunovo__ABC4C73A145E0319");

            entity.ToTable("Racunovodja");

            entity.Property(e => e.RadnikId).ValueGeneratedNever();

            entity.HasOne(d => d.Radnik).WithOne(p => p.Racunovodja)
                .HasForeignKey<Racunovodja>(d => d.RadnikId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Racunovod__Radni__4E88ABD4");
        });

        modelBuilder.Entity<Radnik>(entity =>
        {
            entity.HasKey(e => e.RadnikId).HasName("PK__Radnik__ABC4C73ABA783165");

            entity.ToTable("Radnik");

            entity.Property(e => e.Adresa)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Ime)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Jmbg)
                .HasMaxLength(13)
                .IsUnicode(false)
                .HasColumnName("JMBG");
            entity.Property(e => e.Plata).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Prezime)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TipRadnika)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Mesto).WithMany(p => p.Radniks)
                .HasForeignKey(d => d.MestoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Radnik__MestoId__48CFD27E");

            entity.HasOne(d => d.Servis).WithMany(p => p.Radniks)
                .HasForeignKey(d => d.ServisId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Radnik__ServisId__47DBAE45");
        });

        modelBuilder.Entity<Servi>(entity =>
        {
            entity.HasKey(e => e.ServisId).HasName("PK__Servis__8BED642845CA4C91");

            entity.Property(e => e.Adresa)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Mesto).WithMany(p => p.Servis)
                .HasForeignKey(d => d.MestoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Servis__MestoId__3B75D760");

            entity.HasMany(d => d.Dobavljacs).WithMany(p => p.Servis)
                .UsingEntity<Dictionary<string, object>>(
                    "Saradjuje",
                    r => r.HasOne<DobavljacDelova>().WithMany()
                        .HasForeignKey("DobavljacId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__Saradjuje__Dobav__3F466844"),
                    l => l.HasOne<Servi>().WithMany()
                        .HasForeignKey("ServisId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__Saradjuje__Servi__3E52440B"),
                    j =>
                    {
                        j.HasKey("ServisId", "DobavljacId").HasName("PK__Saradjuj__06051FCBB83291C1");
                        j.ToTable("Saradjuje");
                    });
        });

        modelBuilder.Entity<Vlasnik>(entity =>
        {
            entity.HasKey(e => e.VlasnikId).HasName("PK__Vlasnik__7DE8B91D32970ACF");

            entity.ToTable("Vlasnik");

            entity.Property(e => e.Adresa)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Ime)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Jmbg)
                .HasMaxLength(13)
                .IsUnicode(false)
                .HasColumnName("JMBG");
            entity.Property(e => e.Prezime)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Mesto).WithMany(p => p.Vlasniks)
                .HasForeignKey(d => d.MestoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Vlasnik__MestoId__4222D4EF");
        });

        modelBuilder.Entity<VrstaPopravke>(entity =>
        {
            entity.HasKey(e => e.VrstaPopravkeId).HasName("PK__VrstaPop__02624E6BFF0200FA");

            entity.ToTable("VrstaPopravke");

            entity.Property(e => e.Naziv)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
