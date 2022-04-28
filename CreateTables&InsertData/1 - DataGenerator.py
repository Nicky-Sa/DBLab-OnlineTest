import mysql.connector
import string
import random
from faker import Faker

numbers = "0123456789"
db = mysql.connector.connect(user='root',
                             password='',
                             host='localhost',
                             database='OnlineTest')
cursor = db.cursor()


def execute_scripts_from_file(filename):
    fd = open(filename, 'r')
    sql_file = fd.read()
    fd.close()
    sql_commands = sql_file.split(';')

    for command in sql_commands:
        try:
            if command.strip() != '':
                cursor.execute(command)
        except IOError as msg:
            print("Command skipped: ", msg)


def string_generator(size=5, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def timestamp_generator(farDate=False):
    fake = Faker()
    if farDate:
        return fake.date_time_between(start_date='now', end_date='+10y').strftime("%Y-%m-%d %H:%M:%S")
    else:
        return fake.date_time_between(start_date='-30y', end_date='now').strftime("%Y-%m-%d %H:%M:%S")


def Admin():
    execute_scripts_from_file("Admin.sql")
    sql = "INSERT INTO Admin(full_name, national_ID, salary) VALUES(%s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (string_generator(), string_generator(10, numbers), string_generator(random.randint(3, 7), numbers)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Admin.")


def Support():
    execute_scripts_from_file("Support.sql")
    sql = "INSERT INTO Support(full_name, national_ID, salary, creator_ID) VALUES(%s, %s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (string_generator(), string_generator(10, numbers), string_generator(random.randint(3, 7), numbers),
             random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Support.")


def Tech():
    execute_scripts_from_file("Tech.sql")
    sql = "INSERT INTO Tech(full_name, national_ID, salary, creator_ID) VALUES(%s, %s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (string_generator(), string_generator(10, numbers), string_generator(random.randint(3, 7), numbers),
             random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Tech.")


def Package():
    execute_scripts_from_file("Package.sql")
    sql = "INSERT INTO Package(creation_time, package_name, price, specifications, creator_ID) VALUES(%s, %s, %s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (timestamp_generator(), string_generator(), string_generator(random.randint(2, 5), numbers),
             string_generator(150),
             random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Package.")


def Customer():
    execute_scripts_from_file("Customer.sql")
    sql = "INSERT INTO Customer(full_name, phone_number, current_package_ID) VALUES(%s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (string_generator(), string_generator(11, numbers), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Customer.")


def Ticket():
    execute_scripts_from_file("Ticket.sql")
    sql = "INSERT INTO Ticket(creation_time, end_time, status, content, creator_ID, support_ID, tech_ID) VALUES(%s, %s, %s, %s, %s, %s, %s)"
    values = []
    status = ['CREATED', 'WAITING', 'ANSWERED', 'CLOSED']
    for i in range(100):
        values.append(
            (timestamp_generator(), timestamp_generator(True), status[random.randint(0, 3)], string_generator(),
             random.randint(1, 100), random.randint(1, 100), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Ticket.")


def TestDesigner():
    execute_scripts_from_file("TestDesigner.sql")
    sql = "INSERT INTO TestDesigner(user_name, password, creator_ID) VALUES(%s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (string_generator(), string_generator(), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into TestDesigner.")


def Course():
    execute_scripts_from_file("Course.sql")
    sql = "INSERT INTO Course(name, creator_ID) VALUES(%s, %s)"
    values = []
    for i in range(100):
        values.append(
            (string_generator(), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Course.")


def Test():
    execute_scripts_from_file("Test.sql")
    sql = "INSERT INTO Test(name, course_ID) VALUES(%s, %s)"
    values = []
    for i in range(100):
        values.append(
            (string_generator(), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Test.")


def Question():
    execute_scripts_from_file("Question.sql")
    sql = "INSERT INTO Question(type, text, answer, point, creator_ID) VALUES(%s, %s, %s, %s, %s)"
    values = []
    question_type = ['essay', 'single_choice', 'multiple_choice']
    for i in range(100):
        values.append(
            (question_type[random.randint(0, 2)], string_generator(random.randint(10, 1000)),
             string_generator(random.randint(10, 1000)),
             random.uniform(0, 20), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Question.")


def Responder():
    execute_scripts_from_file("Responder.sql")
    sql = "INSERT INTO Responder(user_name, password, creator_ID) VALUES(%s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (string_generator(), string_generator(), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Responder.")


def TicketRefer():
    execute_scripts_from_file("TicketRefer.sql")
    sql = "INSERT INTO TicketRefer(end_time, ticket_ID, support_ID, tech_ID) VALUES(%s, %s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (timestamp_generator(True), random.randint(1, 100), random.randint(1, 100), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into TicketRefer.")


def Promote():
    execute_scripts_from_file("Promote.sql")
    sql = "INSERT INTO Promote(promote_time, comment, package_ID, admin_ID, customer_ID) VALUES(%s, %s, %s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (timestamp_generator(), string_generator(), random.randint(1, 100), random.randint(1, 100),
             random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into Promote.")


def CourseTestDesigners():
    execute_scripts_from_file("CourseTestDesigners.sql")
    sql = "INSERT INTO CourseTestDesigners(testDesigner_ID, course_ID) VALUES(%s, %s)"
    values = []
    for i in range(100):
        values.append(
            (random.randint(1, 100), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into CourseTestDesigners.")


def TestTestDesigners():
    execute_scripts_from_file("TestTestDesigners.sql")
    sql = "INSERT INTO TestTestDesigners(test_ID, test_designer_ID) VALUES(%s, %s)"
    values = []
    for i in range(100):
        values.append(
            (random.randint(1, 100), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into TestTestDesigners.")


def TestQuestions():
    execute_scripts_from_file("TestQuestions.sql")
    sql = "INSERT INTO TestQuestions(test_ID, question_ID) VALUES(%s, %s)"
    values = []
    for i in range(100):
        values.append(
            (random.randint(1, 100), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into TestQuestions.")


def TestAttempt():
    execute_scripts_from_file("TestAttempt.sql")
    sql = "INSERT INTO TestAttempt(start_attempt_time, finish_attempt_time, grade, test_ID, responder_ID) VALUES(%s, %s, %s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (timestamp_generator(), timestamp_generator(True), random.uniform(0, 20), random.randint(1, 100),
             random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into TestAttempt.")


def QuestionAttempt():
    execute_scripts_from_file("QuestionAttempt.sql")
    sql = "INSERT INTO QuestionAttempt(point, question_ID, responder_ID) VALUES(%s, %s, %s)"
    values = []
    for i in range(100):
        values.append(
            (random.uniform(0, 20), random.randint(1, 100), random.randint(1, 100)))
    cursor.executemany(sql, values)
    print(cursor.rowcount, "rows were inserted into QuestionAttempt.")


execute_scripts_from_file('CreateDB.sql')
Admin()
Support()
Tech()
Package()
Customer()
Ticket()
TestDesigner()
Course()
Test()
Question()
Responder()
TicketRefer()
Promote()
CourseTestDesigners()
TestTestDesigners()
TestQuestions()
TestAttempt()
QuestionAttempt()
db.commit()
