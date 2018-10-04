using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SistemaEquivalencias.Startup))]
namespace SistemaEquivalencias
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
