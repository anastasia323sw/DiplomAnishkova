using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient; // Добавьте эту директиву для работы с MySQL

namespace test
{
    public partial class Form5 : Form
    {
        // Параметры подключения к базе данных
        private const string Server = "127.0.0.1";
        private const string DatabaseName = "DIPL1";
        private const string User = "root";
        private const string Password = "";
        private const string Port = "3306";

        private MySqlConnection connection;

        public Form5()
        {
            InitializeComponent();
            InitializeDatabaseConnection();
        }

        private void InitializeDatabaseConnection()
        {
            string connectionString = $"Server={Server};Database={DatabaseName};User ID={User};Password={Password};Port={Port};";
            connection = new MySqlConnection(connectionString);
        }

        private void OpenConnection()
        {
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        private void CloseConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        private void Form5_Load(object sender, EventArgs e)
        {
            // Загрузка данных для comboBox1
            string query1 = "SELECT SkziName_idSkziName FROM Skzi"; // Используем имя таблицы "user"

            try
            {
                OpenConnection();
                using (MySqlCommand command = new MySqlCommand(query1, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            comboBox1.Items.Add(reader[0]); // Замените "type" на имя столбца
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при загрузке данных: " + ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            // Загрузка данных для comboBox3
            string query2 = "SELECT OrganCrypto_idOrganCrypto FROM Skzi"; // Используем имя таблицы "user"

            try
            {
                OpenConnection();
                using (MySqlCommand command = new MySqlCommand(query2, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            comboBox3.Items.Add(reader[0]); // Загружаем данные в comboBox3
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при загрузке данных: " + ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            // Загрузка данных для comboBox2
            string query3 = "SELECT FioRassilki_idFioRassilki FROM Skzi"; // Используем имя таблицы "user"

            try
            {
                OpenConnection();
                using (MySqlCommand command = new MySqlCommand(query3, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            comboBox2.Items.Add(reader[0]); // Загружаем данные в comboBox2
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при загрузке данных: " + ex.Message);
            }
            finally
            {
                CloseConnection();
            }
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        // Метод для добавления данных в таблицу Skzi (колонка serial_n)
        private void buttonAdd_Click(object sender, EventArgs e)
        {
            // Получаем текст из textBox1
            string serialNumber = textBox1.Text;

            // Проверяем, что текст не пустой
            if (string.IsNullOrEmpty(serialNumber))
            {
                MessageBox.Show("Пожалуйста, введите серийный номер.");
                return;
            }

            // SQL-запрос для вставки данных
            string query = "INSERT INTO Skzi (serial_n) VALUES (@serial_n)";

            try
            {
                // Открываем соединение с базой данных
                OpenConnection();

                // Создаем команду для выполнения SQL-запроса
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Добавляем параметр для предотвращения SQL-инъекций
                    command.Parameters.AddWithValue("@serial_n", serialNumber);

                    // Выполняем запрос
                    int rowsAffected = command.ExecuteNonQuery();

                    // Проверяем, была ли вставка успешной
                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Данные успешно добавлены в таблицу.");
                        textBox1.Clear(); // Очищаем textBox1 после успешной вставки
                    }
                    else
                    {
                        MessageBox.Show("Ошибка при добавлении данных.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
            finally
            {
                // Закрываем соединение с базой данных
                CloseConnection();
            }
        }

        // Метод для добавления данных в таблицу Skzi (колонка ekzemp_n)
        private void buttonAddEkzemp_Click(object sender, EventArgs e)
        {
            // Получаем текст из textBox2
            string ekzempNumber = textBox2.Text;

            // Проверяем, что текст не пустой
            if (string.IsNullOrEmpty(ekzempNumber))
            {
                MessageBox.Show("Пожалуйста, введите номер экземпляра.");
                return;
            }

            // SQL-запрос для вставки данных
            string query = "INSERT INTO Skzi (ekzemp_n) VALUES (@ekzemp_n)";

            try
            {
                // Открываем соединение с базой данных
                OpenConnection();

                // Создаем команду для выполнения SQL-запроса
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Добавляем параметр для предотвращения SQL-инъекций
                    command.Parameters.AddWithValue("@ekzemp_n", ekzempNumber);

                    // Выполняем запрос
                    int rowsAffected = command.ExecuteNonQuery();

                    // Проверяем, была ли вставка успешной
                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Данные успешно добавлены в таблицу.");
                        textBox2.Clear(); // Очищаем textBox2 после успешной вставки
                    }
                    else
                    {
                        MessageBox.Show("Ошибка при добавлении данных.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
            finally
            {
                // Закрываем соединение с базой данных
                CloseConnection();
            }
        }

        // Метод для добавления данных в таблицу Skzi (колонка date_poluch)
        private void buttonAddDate_Click(object sender, EventArgs e)
        {
            // Получаем текст из textBox3
            string datePoluch = textBox3.Text;

            // Проверяем, что текст не пустой
            if (string.IsNullOrEmpty(datePoluch))
            {
                MessageBox.Show("Пожалуйста, введите дату получения.");
                return;
            }

            // Проверяем, что введенные данные соответствуют формату даты (опционально)
            DateTime parsedDate;
            if (!DateTime.TryParse(datePoluch, out parsedDate))
            {
                MessageBox.Show("Пожалуйста, введите дату в корректном формате (например, ГГГГ-ММ-ДД).");
                return;
            }

            // SQL-запрос для вставки данных
            string query = "INSERT INTO Skzi (date_poluch) VALUES (@date_poluch)";

            try
            {
                // Открываем соединение с базой данных
                OpenConnection();

                // Создаем команду для выполнения SQL-запроса
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Добавляем параметр для предотвращения SQL-инъекций
                    command.Parameters.AddWithValue("@date_poluch", parsedDate.ToString("yyyy-MM-dd")); // Форматируем дату

                    // Выполняем запрос
                    int rowsAffected = command.ExecuteNonQuery();

                    // Проверяем, была ли вставка успешной
                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Данные успешно добавлены в таблицу.");
                        textBox3.Clear(); // Очищаем textBox3 после успешной вставки
                    }
                    else
                    {
                        MessageBox.Show("Ошибка при добавлении данных.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
            finally
            {
                // Закрываем соединение с базой данных
                CloseConnection();
            }
        }

        // Метод для добавления данных в таблицу Skzi (колонка nomer_poluch)
        private void buttonAddNomerPoluch_Click(object sender, EventArgs e)
        {
            // Получаем текст из textBox5
            string nomerPoluch = textBox5.Text;

            // Проверяем, что текст не пустой
            if (string.IsNullOrEmpty(nomerPoluch))
            {
                MessageBox.Show("Пожалуйста, введите номер получателя.");
                return;
            }

            // SQL-запрос для вставки данных
            string query = "INSERT INTO Skzi (nomer_poluch) VALUES (@nomer_poluch)";

            try
            {
                // Открываем соединение с базой данных
                OpenConnection();

                // Создаем команду для выполнения SQL-запроса
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Добавляем параметр для предотвращения SQL-инъекций
                    command.Parameters.AddWithValue("@nomer_poluch", nomerPoluch);

                    // Выполняем запрос
                    int rowsAffected = command.ExecuteNonQuery();

                    // Проверяем, была ли вставка успешной
                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Данные успешно добавлены в таблицу.");
                        textBox5.Clear(); // Очищаем textBox5 после успешной вставки
                    }
                    else
                    {
                        MessageBox.Show("Ошибка при добавлении данных.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
            finally
            {
                // Закрываем соединение с базой данных
                CloseConnection();
            }
        }

        // Метод для добавления данных в таблицу Skzi (колонка vozvr_date_sopr)
        private void buttonAddVozvrDate_Click(object sender, EventArgs e)
        {
            // Получаем текст из textBox7
            string vozvrDate = textBox7.Text;

            // Проверяем, что текст не пустой
            if (string.IsNullOrEmpty(vozvrDate))
            {
                MessageBox.Show("Пожалуйста, введите дату возврата сопроводительного письма.");
                return;
            }

            // Проверяем, что введенные данные соответствуют формату даты
            DateTime parsedDate;
            if (!DateTime.TryParse(vozvrDate, out parsedDate))
            {
                MessageBox.Show("Пожалуйста, введите дату в корректном формате (например, ГГГГ-ММ-ДД).");
                return;
            }

            // SQL-запрос для вставки данных
            string query = "INSERT INTO Skzi (vozvr_date_sopr) VALUES (@vozvr_date_sopr)";

            try
            {
                // Открываем соединение с базой данных
                OpenConnection();

                // Создаем команду для выполнения SQL-запроса
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Добавляем параметр для предотвращения SQL-инъекций
                    command.Parameters.AddWithValue("@vozvr_date_sopr", parsedDate.ToString("yyyy-MM-dd")); // Форматируем дату

                    // Выполняем запрос
                    int rowsAffected = command.ExecuteNonQuery();

                    // Проверяем, была ли вставка успешной
                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Данные успешно добавлены в таблицу.");
                        textBox7.Clear(); // Очищаем textBox7 после успешной вставки
                    }
                    else
                    {
                        MessageBox.Show("Ошибка при добавлении данных.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
            finally
            {
                // Закрываем соединение с базой данных
                CloseConnection();
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            // Обработчик события изменения текста в textBox2
        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {
            // Обработчик события изменения текста в textBox10
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Обработка события выбора элемента в comboBox3
            if (comboBox3.SelectedItem != null)
            {
                string selectedValue = comboBox3.SelectedItem.ToString();
                MessageBox.Show("Вы выбрали: " + selectedValue);
            }
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Обработка события выбора элемента в comboBox2
            if (comboBox2.SelectedItem != null)
            {
                string selectedValue = comboBox2.SelectedItem.ToString();
                MessageBox.Show("Вы выбрали: " + selectedValue);
            }
        }

        private void textBox13_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }
    }
}