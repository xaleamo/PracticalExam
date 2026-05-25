using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace PracticalExam
{
    public partial class Form1 : Form
    {
        SqlConnection conn;
        SqlDataAdapter daProjects, daTasks;
        DataSet ds;
        SqlCommandBuilder cb;
        BindingSource bsProjects, bsTasks;

        private void Save_Click(object sender, EventArgs e)
        {
            daTasks.Update(ds, "Tasks");
        }

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(@"Data Source=ALEX-PC\SQLEXPRESS;Initial Catalog=ProjectTasks;Integrated Security=True");
            ds = new DataSet();
            daProjects = new SqlDataAdapter("SELECT * FROM Projects", conn);
            daTasks = new SqlDataAdapter("SELECT * FROM Tasks", conn);

            daProjects.Fill(ds, "Projects");
            daTasks.Fill(ds, "Tasks");
            cb = new SqlCommandBuilder(daTasks);

            DataRelation dr = new DataRelation("FK_Tasks_Projects", ds.Tables["Projects"].Columns["ProjectID"], ds.Tables["Tasks"].Columns["ProjectId"]);

            ds.Relations.Add(dr);

            bsProjects = new BindingSource();
            bsTasks = new BindingSource();

            bsProjects.DataSource = ds;
            bsProjects.DataMember = "Projects";

            bsTasks.DataSource = bsProjects;
            bsTasks.DataMember = "FK_Tasks_Projects";

            dgvProjects.DataSource = bsProjects;
            dgvTasks.DataSource = bsTasks;
        }
    }
}
