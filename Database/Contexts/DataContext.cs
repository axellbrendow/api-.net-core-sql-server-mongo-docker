using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using NetCoreApi.Core.Models;

namespace NetCoreApi.Database.Contexts
{
    public class DataContext : DbContext
    {
        public DataContext(
            DbContextOptions<DataContext> options
        ) : base(options) { }

        public DbSet<WeatherForecast> WeatherForecasts { get; set; }
    }
}
