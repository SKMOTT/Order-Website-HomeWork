using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BF
{
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            noodleDetailsView.DataBind();
            userShowLB.Text = Session["name"] + "歡迎光臨<br>您還有 : " + Session["money"] + "元";
            if (!IsPostBack)
            {
                noodlePriceLB.Text = "";
                noodleQtLB.Text = "";
                noodleImage.ImageUrl = "./pic/未選取.jpg";
                for (int i = 0; i < 50; i++)
                {
                    cupList.Items.Insert(i, new ListItem("" + (i + 1), "" + (i + 1)));
                }
                cupList.SelectedIndex = 0;
            }
        }

        protected void noodleList_SelectedIndexChanged(object sender, EventArgs e)
        {
            noodleImage.ImageUrl = "./pic/" + noodleList.SelectedItem.Text.ToString() + ".jpg";
            if ( 0 == noodleList.SelectedIndex)
            {
                noodlePriceLB.Text = "";
                noodleQtLB.Text = "";
            }
            else
            {
                noodlePriceLB.Text = noodleDetailsView.Rows[1].Cells[1].Text + " 元";
                noodleQtLB.Text = "\t庫存 : " + noodleDetailsView.Rows[0].Cells[1].Text + " 個";
            }
        }

        protected void orderBT_Click(object sender, EventArgs e)
        {
            noodleDataSelect.Insert();

            SqlConnection orderCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\clientdata.mdf;Integrated Security=True");
            orderCon.Open();
            SqlCommand orderCmd = new SqlCommand("select top 1 order_id from orderTable by order_id Desc", orderCon);
            SqlDataReader orderDr;
            orderDr = orderCmd.ExecuteReader();
            if (orderDr.Read()) 
            {
                Session["order_id"] = orderDr["order_id"];
                orderBT.Text = orderDr["order_id"] + " 號訂單";
                orderBT.Enabled = false;
            }
            orderDr.Close();
        }

        protected void truncateTableBT_Click(object sender, EventArgs e)
        {
            SqlConnection orderCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\clientdata.mdf;Integrated Security=True");
            orderCon.Open();
            SqlCommand orderTableTruncateCmd = new SqlCommand("truncate table orderTable", orderCon);
            orderTableTruncateCmd.ExecuteNonQuery();
            orderBT.Text = "前往訂購";
        }
    }
}