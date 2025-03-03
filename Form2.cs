using System;
using System.Data;
using System.Windows.Forms;
using MySqlConnector;

namespace test
{
    public partial class Form2 : Form
    {
        private const string Server = "127.0.0.1";
        private const string DatabaseName = "DIPL1";
        private const string User = "root";
        private const string Password = "";
        private const string Port = "3306";

        public Form2()
        {
            InitializeComponent();
            textBox2.PasswordChar = '*'; // Устанавливаем символ для скрытия пароля
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            // При загрузке формы можно сразу попытаться подключиться к БД (не обязательно)
            try
            {
                using (MySqlConnection connection = GetConnection())
                {
                    if (connection != null)
                    {
                        // Загружаем данные в DataGridView
                        LoadDataIntoDataGridView();
                    }
                }
            }
            catch (MySqlException ex)
            {
                MessageBox.Show($"Ошибка при загрузке формы: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Обработчик нажатия кнопки "Вход"
        private void Button1_Click(object sender, EventArgs e)
        {
            string email = textBox1.Text; // Используем TextBox1 для email
            string password = textBox2.Text; // Используем TextBox2 для пароля

            if (CheckLogin(email, password))
            {
                // Если email и пароль верны, открываем Form4
                Form4 form4 = new Form4();
                form4.Show();
                this.Hide(); // Скрываем текущую форму (Form2)
            }
            else
            {
                // Если email или пароль неверны, выводим сообщение об ошибке
                MessageBox.Show("Неверный email или пароль", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Метод для получения соединения с базой данных
        private MySqlConnection GetConnection()
        {
            string connectionString = $"Server={Server};Database={DatabaseName};Uid={User};Pwd={Password};Port={Port}";
            MySqlConnection connection = new MySqlConnection(connectionString);

            try
            {
                connection.Open();
                Console.WriteLine("Успешное подключение к базе данных!"); // Для отладки
                return connection;
            }
            catch (MySqlException ex)
            {
                MessageBox.Show($"Ошибка подключения к базе данных: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
        }

        // Метод для закрытия соединения с базой данных
        private void CloseConnection(MySqlConnection connection)
        {
            if (connection != null && connection.State == ConnectionState.Open)
            {
                try
                {
                    connection.Close();
                    Console.WriteLine("Соединение с базой данных закрыто."); // Для отладки
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show($"Ошибка закрытия соединения с базой данных: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // Метод для загрузки данных в DataGridView
        private void LoadDataIntoDataGridView()
        {
            try
            {
                using (MySqlConnection connection = GetConnection())
                {
                    if (connection != null)
                    {
                        string query = "SELECT * FROM user"; // Используем имя таблицы "user"

                        using (MySqlCommand command = new MySqlCommand(query, connection))
                        {
                            using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                            {
                                DataTable dataTable = new DataTable();
                                adapter.Fill(dataTable);

                                dataGridView1.DataSource = dataTable; // Убедитесь, что dataGridView1 существует на форме
                            }
                        }
                        CloseConnection(connection);
                    }
                }
            }
            catch (MySqlException ex)
            {
                MessageBox.Show($"Ошибка при загрузке данных в DataGridView: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Общая ошибка: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Метод для проверки email и пароля
        private bool CheckLogin(string email, string password)
        {
            try
            {
                using (MySqlConnection connection = GetConnection())
                {
                    if (connection != null)
                    {
                        // Используем столбец "email" и "password" для проверки
                        string query = "SELECT COUNT(*) FROM user WHERE email = @email AND password = @password";

                        using (MySqlCommand command = new MySqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@email", email);
                            command.Parameters.AddWithValue("@password", password);

                            int count = Convert.ToInt32(command.ExecuteScalar());

                            return count > 0; // Если count > 0, значит, пользователь с таким email и паролем существует
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                MessageBox.Show($"Ошибка при проверке email и пароля: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Общая ошибка: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            return false; // Если что-то пошло не так, возвращаем false
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}