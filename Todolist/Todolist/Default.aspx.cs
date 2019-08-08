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
            if (!IsPostBack)
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

        protected void rptList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete" && e.CommandArgument.ToString() != "")
            {
                using (var db = new Entities())
                {
                    int id;
                    if(int.TryParse(e.CommandArgument.ToString(), out id)) {
                        var task = db.tblTasks.FirstOrDefault(o => o.ID == id);
                        task.RecordStatus = Const.Inactive;
                        db.SaveChanges();
                        Refresh();
                    }
                    else {
                        lbMessage.Text = "Can not find the task with ID: " + e.CommandArgument.ToString();
                    }
                }
            }
        }
    }
}