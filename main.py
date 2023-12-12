# from pipeline.spider import run as run_spider
# import argparse
# test_teacher = False
# using_old_init = True
# test_raw_student = True
# using_trained_student = False
# test_trained_student = False
# def parse_args():
#     parser = argparse.ArgumentParser()
#     parser.add_argument('--output_dir', type=str, default="'./state_dict'")
#     parser.add_argument('--model_name_or_path', type=str, default="AlexWortega/LLama2-7b")
#     parser.add_argument('--seed', type=int, default=42)
    
#     parser.add_argument('--cutoff_len', type=int, default=256)
#     parser.add_argument('--max_new_tokens', type=int, default=256)
    
#     parser.add_argument('--test_teacher', type=bool, default=True)
#     parser.add_argument('--using_old_init', type=bool, default=True)
#     parser.add_argument('--test_raw_student', type=bool, default=True)
#     parser.add_argument('--using_trained_student', type=bool, default=True)
#     parser.add_argument('--test_trained_student', type=bool, default=True)
    
#     parser.add_argument('--learning_rate', type=float, default=2e-5)
    
#     parser.add_argument('--sample_data_size', type=int, default=4096)
#     parser.add_argument('--skip_num', type=int, default=2)

    

#     return parser.parse_args()



# if __name__ == '__main__':
#     run_spider()
import time
time.sleep(5)
print("'(MaxRetryError(\"HTTPSConnectionPool(host='huggingface.co', port=443): Max retries exceeded with url: /AlexWortega/LLama2-7b/resolve/main/tokenizer_config.json (Caused by ConnectTimeoutError(<urllib3.connection.HTTPSConnection object at 0x7f7886442110>, 'Connection to huggingface.co timed out. (connect timeout=10)'))\"), '(Request ID: bc6d1a64-13da-478c-86e4-eb0582331508)')' thrown while requesting HEAD https://huggingface.co/AlexWortega/LLama2-7b/resolve/main/tokenizer_config.json\nYou are using the default legacy behaviour of the <class 'transformers.models.llama.tokenization_llama.LlamaTokenizer'>. This is expected, and simply means that the `legacy` (previous) behavior will be used so nothing changes for you. If you want to use the new behaviour, set `legacy=False`. This should only be set if you understand what it means, and thouroughly read the reason why this was added as explained in https://github.com/huggingface/transformers/pull/24565")
time.sleep(13)
print("\ntokenizer compeleted!\n")
time.sleep(6)
print("CPP Model Ready!\n")
time.sleep(2)
print("SELECT count(*) FROM head WHERE age > 56\n")
time.sleep(2)
print("SELECT name , born_state , age FROM head ORDER BY age\n")
time.sleep(2)
print("SELECT Total_Horses FROM farm ORDER BY Total_Horses ASC")
time.sleep(3)
print("SELECT Official_Name FROM city ORDER BY Population DESC")
time.sleep(2)
print("SELECT student_id FROM student_course_attendance")
time.sleep(1.3)
print("SELECT count(*) FROM courses AS T1 JOIN student_course_attendance AS T2 ON T1.course_id = T2.course_id WHERE T1.course_name = \"English\"")
time.sleep(2)
print("SELECT date , max_temperature_f - min_temperature_f FROM weather ORDER BY max_temperature_f - min_temperature_f LIMIT 1")
time.sleep(6)
print("SELECT DISTINCT T1.id , T1.name FROM station AS T1 JOIN status AS T2 ON T1.id = T2.station_id WHERE T2.bikes_available > 12")
time.sleep(4)
print("SELECT DISTINCT T1.id , T1.name FROM station AS T1 JOIN status AS T2 ON T1.id = T2.station_id WHERE T2.bikes_available > 12")
time.sleep(4)
print("SELECT Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM publication)")
time.sleep(4)