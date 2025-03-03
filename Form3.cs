using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace test
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            // Строка подключения к базе данных
            string connectionString = "server=127.0.0.1;user=root;database=DIPL1;port=3306;password=;";

            // SQL-запрос для вставки данных
            string query = "INSERT INTO User (email, password, last_name, first_name, surname, is_admin, date_joined, dolzhnost, gr_key) " +
                           "VALUES (@email, @password, @last_name, @first_name, @surname, @is_admin, @date_joined, @dolzhnost, @gr_key)";

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        // Добавление параметров
                        command.Parameters.AddWithValue("@email", textBox7.Text);
                        command.Parameters.AddWithValue("@password", textBox6.Text);
                        command.Parameters.AddWithValue("@last_name", textBox5.Text);
                        command.Parameters.AddWithValue("@first_name", textBox4.Text);
                        command.Parameters.AddWithValue("@surname", textBox3.Text);
                        command.Parameters.AddWithValue("@is_admin", "0"); // По умолчанию не админ
                        command.Parameters.AddWithValue("@date_joined", DateTime.Now);
                        command.Parameters.AddWithValue("@dolzhnost", textBox2.Text);
                        command.Parameters.AddWithValue("@gr_key", textBox1.Text);

                        // Выполнение команды
                        int result = command.ExecuteNonQuery();

                        // Проверка результата
                        if (result > 0)
                        {
                            MessageBox.Show("Регистрация завершена успешно!");
                            // Переход на Form2
                            Form2 form2 = new Form2();
                            form2.Show();
                            this.Hide(); // Скрыть текущую форму
                        }
                        else
                        {
                            MessageBox.Show("Ошибка при регистрации.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            // Назначение обработчика события для кнопки
            button1.Click += new EventHandler(Button1_Click);
        }
    }
}