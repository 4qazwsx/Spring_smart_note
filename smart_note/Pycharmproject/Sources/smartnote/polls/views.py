from django.shortcuts import render
import cx_Oracle
import errno
from django.db import models
# Create your views here.
try:
    import Image
except ImportError:
    from PIL import Image     #pip install pillow
import pytesseract #pip install pytesseract
import configparser
import os
def index(request):
    aa = ""
    print("os.path.dirname(os.path.dirname(os.path.realpath(__file__)))->"+os.path.dirname(os.path.dirname(os.path.realpath(__file__))))
    print("os.path.join(BASE_DIR, 'media')->"+os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))), 'polls\\resource'))
    dsn = cx_Oracle.makedsn("211.183.2.63", 1521, "xe")
    con = cx_Oracle.connect("s20200101", "tiger", dsn)
    cursor = con.cursor()
    config = configparser.ConfigParser()
    config.read(os.path.dirname(os.path.realpath(__file__)) + os.sep + 'envs' + os.sep + 'property.ini')
    try:
        sql_select = """select max(note_id) max from note"""
        cursor.execute(sql_select)
        for max in cursor:
            for col in max:
                v_note_id = col + 1

        # for note_id in cursor:
        #     print(note_id)

    except Exception as message:
        print("++++++++++++++error+++++++++" + message)
    aa = ""
    number = str(v_note_id)
    for root, dirs, files in os.walk(os.path.dirname(os.path.realpath(__file__)) + config['Path']['OriImgPath']+number):
        for fname in files:
            print("------------------------root->" + root)
            print("------------------------fname->" + fname)

            fullName = os.path.join(root, fname)
            print("-------------<<<" + fullName)
            img = Image.open(fullName)
            aa=aa+"["+ pytesseract.image_to_string(img, lang='eng', config='--psm 1 -c preserve_interword_spaces=1')+"]"
            print("---------------------->>" + aa)
    sql_insert = "insert into note values(note_id.nextval,:v_note_title,:v_note_contents, sysdate, 1)"
    # sql_insert = "insert into note values(note_id.nextval,:v_note_title,'test', sysdate, 1)"

    cursor.execute(sql_insert, v_note_title=number, v_note_contents=aa)
    con.commit()

    con.close()
    context = {'outText': aa}
    return render(request,'polls/ocrtest.html',context)

def ocrtest(request):
    dsn = cx_Oracle.makedsn("211.183.2.63", 1521, "xe")
    con = cx_Oracle.connect("s20200101", "tiger", dsn)
    cursor = con.cursor()
    config = configparser.ConfigParser()
    config.read(os.path.dirname(os.path.realpath(__file__)) + os.sep + 'envs' + os.sep + 'property.ini')
    try:
        sql_select = """select max(note_id) max from note"""
        cursor.execute(sql_select)
        for max in cursor:
            for col in max:
                v_note_id=col+1

        # for note_id in cursor:
        #     print(note_id)

    except Exception as message:
        print("++++++++++++++error+++++++++"+message)
    aa=""
    number=str(v_note_id)
    for root, dirs, files in os.walk(os.path.dirname(os.path.realpath(__file__)) + config['Path']['OriImgPath']):
        for fname in files:
            print("------------------------root->"+root)
            print("------------------------fname->" + fname)

            fullName = os.path.join(root, fname)
            print("-------------<<<"+fullName)
            img = Image.open(fullName)
            outText = pytesseract.image_to_string(img, lang='eng', config='--psm 1 -c preserve_interword_spaces=1')
            print("---------------------->>"+outText)
    context ={'outText':outText}
    return render(request,'polls/ocrtest.html',context)
def ocr(request):
    #oracle연결
    #mem_id = request.session['mem_id']
    dsn = cx_Oracle.makedsn("211.183.2.63", 1521, "xe")
    con = cx_Oracle.connect("s20200101", "tiger", dsn)
    # dsn = cx_Oracle.makedsn("localhost", 1521, "xe")
    # con= cx_Oracle.connect("scott", "tiger", dsn)


    cursor = con.cursor()

    note_title = request.GET.get('note_title')
    # Config Parser 초기화
    config = configparser.ConfigParser()
    # Config File 읽기
    config.read(os.path.dirname(os.path.realpath(__file__)) + os.sep + 'envs' + os.sep + 'property.ini')

    def ocrToStr(fullPath, fileName, lang='eng'):  # 디폴트는 영어로 추출
        # 이미지 경로
        print("ocrStart")
        try:
            img = Image.open(fullPath)
            print("img완료")
        except Exception as message:
            print("++++++++++++++error+++++++++" + message)
        # txtName = os.path.join(outTxtPath, fileName.split('.')[0])

        # 추출(이미지파일, 추출언어, 옵션)
        # preserve_interword_spaces : 단어 간격 옵션을 조절하면서 추출 정확도를 확인한다.
        # psm(페이지 세그먼트 모드 : 이미지 영역안에서 텍스트 추출 범위 모드)
        # psm 모드 : https://github.com/tesseract-ocr/tesseract/wiki/Command-Line-Usage
        try:
            print("ocr시작")
            outText = pytesseract.image_to_string(img, lang=lang, config='--psm 1 -c preserve_interword_spaces=1')
            print("ocr완료")
        except Exception as message:
            print("++++++++++++++error+++++++++" + message)


        print('+++ OCT Extract Result +++')
        print('Extract FileName ->>> : ', fileName, ' : <<<-')
        print('\n\n')
        # 출력
        print(outText)
        # 추출 문자 텍스트 파일 쓰기
        # strToTxt(txtName, outText)
        return outText

    # # 문자열 -> 텍스트파일 개별 저장
    # def strToTxt(txtName, outText):
    #     with open(txtName + '.txt', 'w', encoding='utf-8') as f:
    #         f.write(outText)
    #
    # outTxtPath = os.path.dirname(os.path.realpath(__file__)) + config['Path']['OcrTxtPath']
    # print("-------------------------------------------------------")
    # print("os.path.realpath(__file__)->"+os.path.realpath(__file__))
    # print("config['Path']['OcrTxtPath']->"+config['Path']['OcrTxtPath'])
    # print("os.path.dirname(os.path.realpath(__file__))->"+os.path.dirname(os.path.realpath(__file__)))
    # print("outTxtPath->"+outTxtPath)
    try:
        sql_select = """select max(note_id) max from note"""
        cursor.execute(sql_select)
        for max in cursor:
            for col in max:
                v_note_id=col+1

        # for note_id in cursor:
        #     print(note_id)

    except Exception as message:
        print("++++++++++++++error+++++++++"+message)
    aa=""
    number=str(v_note_id)
    print("**************"+number)
    # try:
    #     if not (os.path.isdir(os.path.dirname(os.path.realpath(__file__)) + config['Path']['OriImgPath']+number)):
    #         os.makedirs(os.path.dirname(os.path.realpath(__file__)) + config['Path']['OriImgPath']+number)
    #         photo = models.ImageField(upload_to = "image")
    # except OSError as e:
    #     if e.errno != errno.EEXIST:
    #         print("Fail to create directory")
    #         raise
    for root, dirs, files in os.walk(os.path.dirname(os.path.realpath(__file__)) + config['Path']['OriImgPath']):
        for fname in files:
            print("------------------------root->"+root)
            print("------------------------fname->" + fname)

            fullName = os.path.join(root, fname)
            print("------------------------fullName->" + fullName)
            #한글+영어 추출(kor, eng , kor+eng)
            try:
                print("asdfhjklasdfhjkl")
                aa=aa+"["+ocrToStr(fullName, fname,'eng')+"]"
                print("try다음"+aa)
            except Exception as e:
                print("------error->"+e)
    # print(aa)
    sql_insert = "insert into note values(note_id.nextval,:v_note_title,:v_note_contents, sysdate, 1)"
    # sql_insert = "insert into note values(note_id.nextval,:v_note_title,'test', sysdate, 1)"

    cursor.execute(sql_insert, v_note_title=note_title, v_note_contents=aa)
    con.commit()



    con.close()
    context={'aa':aa,'id':note_title}
    return render(request,'polls/ocr.html',context)