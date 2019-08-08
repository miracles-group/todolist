using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Todolist
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                using(var db = new Entities())
                {
                    var list = db.tblTasks.Where(o => o.RecordStatus == Const.Active).ToList();
                    rptList.DataSource = list;
                    rptList.DataBind();
                }
            }
        }
    }
}