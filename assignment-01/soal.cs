using System;

public class Assigment1 {
    public static void Main() {
        bool flag = true;
        int num = 0;
       do
       {

           Console.WriteLine("");
           Console.WriteLine("");
           Console.WriteLine("===Assigment 1===");
           Console.WriteLine("1. Soal 1");
           Console.WriteLine("2. Soal 2");
           Console.WriteLine("3. Soal 3");
           Console.WriteLine("4. Soal 4");
           Console.WriteLine("5. Soal 5");
           Console.WriteLine("6. exit");    
           Console.Write("Select Menu : ");
           num = int.Parse(Console.ReadLine());

           switch(num)
           {
               case 1:
                soal1();
                break;
               case 2:
                soal2();
                break;
               case 3:
                soal3();
                break;
               case 4:
                soal4();
                break;
               case 5:
                soal5();
                break;
               case 6:
                flag = false;
                break; 
           }


       } while (flag);
    }

    public static void soal1() 
    {
       int n = 5;
       char temp = 'A';

       for (int i = 0; i < n; i++) 
       {
            for (int j = n; j > i; j--)
            {
                Console.Write(" ");
            }

            for (int k = 0; k < i + 1; k++) 
            {
                Console.Write("{0}", (char) (temp+k));
            }

            for (int l = 0; l < i; l++) 
            {
                Console.Write("{0}", (char) (temp+(i-l-1)));
            }

            Console.WriteLine();
       }

        Console.WriteLine("");
        Console.WriteLine("Press enter...");
        Console.ReadLine();
    }

    public static void soal2() 
    {
       int n;
       int temp = 1;

       Console.Write("Enter the range=");
       n = int.Parse(Console.ReadLine());

       for (int i = 0; i < n; i++) 
       {
            for (int j = n; j > i; j--)
            {
                Console.Write(" ");
            }

            for (int k = 0; k < i + 1; k++) 
            {
                Console.Write(temp+k);
            }

            for (int l = 0; l < i; l++) 
            {
                Console.Write(temp+(i-l-1));
            }

            Console.WriteLine();
       }

        Console.WriteLine("");
        Console.WriteLine("Press enter...");
        Console.ReadLine();
    }

    public static void soal3() 
    {
      int n;

      Console.Write("Enter any Number : ");
      n = int.Parse(Console.ReadLine());

      Console.WriteLine("Factorial of {0} is {1}", n, factorial(n));


        Console.WriteLine("");
        Console.WriteLine("Press enter...");
        Console.ReadLine();
    }

    public static void soal4()
    {
       int number;
       int reverse = 0;

       Console.Write("Enter a number: ");
       number = int.Parse(Console.ReadLine());

       while (number > 0) {
           reverse = (reverse * 10) + (number % 10);
           number = (int) (number /  10.0);
       }

       Console.Write("Reverse number : " + reverse);

        Console.WriteLine("");
        Console.WriteLine("Press enter...");
        Console.ReadLine();
        
    }

    public static void soal5() 
    {
       string number;
       string result = "";

       Console.Write("Enter a number: ");
       number = Console.ReadLine();
       
       foreach (char c in number)
       {
           switch(c)
           {
               case '0':
                    result += "zero ";
                    break;
               case '1':
                    result += "one ";
                    break;
               case '2':
                    result += "two ";
                    break;
               case '3':
                    result += "three ";
                    break;
               case '4':
                    result += "four ";
                    break;
               case '5':
                    result += "five ";
                    break;
                case '6':
                    result += "six ";
                    break;               
                case '7':
                    result += "seven ";
                    break; 
                case '8':
                    result += "eight ";
                    break; 
                case '9':
                    result += "nine ";
                    break; 
           }
       }

        Console.WriteLine(result);

        Console.WriteLine("");
        Console.WriteLine("Press enter...");
        Console.ReadLine();
    }
    public static int factorial(int n)
    {
        if (n == 0) return 1;

        return n * factorial(n-1);
    }

}