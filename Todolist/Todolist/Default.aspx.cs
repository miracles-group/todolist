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
                Refresh();
            }
        }

        public void Refresh()
        {
            using (var db = new Entities())
            {
                var list = db.tblTasks.Where(o => o.RecordStatus == Const.Active).ToList();
                rptList.DataSource = list;
                rptList.DataBind();
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            using (var db = new Entities())
            {
                db.tblTasks.Add(new tblTask
                {
                    Title = txtTaskName.Text,
                    RecordStatus = Const.Active
                });
                db.SaveChanges();
            }
            Refresh();
        }
    }
}