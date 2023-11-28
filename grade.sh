CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
expected="ListExamples.java"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

file=`find . -name "ListExamples.java" `

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f $file ]] && [[ $file == *ListExamples.java* ]]
then 
    cp $file grading-area
    echo "Student file found"
else 
    echo "Student file not found"
    exit 1
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area

cd grading-area
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java

if [[ $? -ne 0 ]]
then 
    echo "Compilation error"
    exit 1
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples

