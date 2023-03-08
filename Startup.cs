using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Group_C_Autoshop.Startup))]
namespace Group_C_Autoshop
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
