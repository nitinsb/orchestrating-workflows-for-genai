from airflow.sdk import dag, task, chain


@dag
def my_first_dag():

    @task
    def my_task_1():
        return {"my_word" : "Airflow!"}
    
    _my_task_1 = my_task_1() # Call the task to create the task instance use that can be linked later

    @task 
    def my_task_2(my_dict):
        print(my_dict["my_word"])

    _my_task_2 = my_task_2(my_dict=_my_task_1)

    @task 
    def my_task_3():
        print("Hi from my_task_3!")

    _my_task_3 = my_task_3()

    chain(_my_task_1, _my_task_3)   
        

my_first_dag()
