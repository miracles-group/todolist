using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Todolist
{
    public partial class Detail : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDetail();
            }
        }

        public void GetDetail()
        {
            using (var db = new Entities())
            {
                var idparam = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : string.Empty;
                int id;
                if(int.TryParse(idparam, out id))
                {
                    var item = db.tblTasks.FirstOrDefault(o => o.ID == id);
                    txtTaskName.Text = item.Title;
                    txtDescription.Text = item.Description;
                    txtDueDate.Text = item.DueDate != null ? item.DueDate.Value.ToString("yyyy-MM-dd") : string.Empty;
                }
                else
                {
                    lbMessage.Text = "Can not find the task with ID: " + idparam;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (var db = new Entities())
            {
                DateTime duedate;
                if(!DateTime.TryParse(txtDueDate.Text, out duedate))
                {
                    lbMessage.Text = "Due Date must used format MM/dd/yyyy ";
                    return;
                }
                var idparam = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : string.Empty;
                int id;
                if (int.TryParse(idparam, out id))
                {
                    var item = db.tblTasks.FirstOrDefault(o => o.ID == id);
                    item.Title = txtTaskName.Text;
                    item.Description = txtDescription.Text;
                    item.DueDate = duedate;
                    db.SaveChanges();
                    Response.Redirect("/");
                }
                else
                {
                    lbMessage.Text = "Can not find the task with ID: " + idparam;
                }
            }
        }
    }
}