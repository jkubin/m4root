# vim:mps+=`\:'
#
# Java

# A → β
define(`BETTER', `It`'RR()s better now!')    <--- note: the ' is replaced by RR()

# a tool to instantly see a length
define(`MY_RULER', defn(`RULER_DEC'))
#define(`MY_RULER', defn(`RULER_HEX'))
MY_RULER(40)

divert(0)dnl
/**
 * DONTE()
 */

public class HelloWorld
{
	public static void main(String args[])
	{
		/*                  MY_RULER */
		System.out.println("Let's say: 'SYMBOL' It's damn good!");

		/*                  MY_RULER */
		System.out.println("BETTER`'LL()'BETTER");
		System.out.println("BETTER`'BETTER");

		/*                  MY_RULER */
		System.out.println("LL()LL()LL()BETTER!!");
	}
}
