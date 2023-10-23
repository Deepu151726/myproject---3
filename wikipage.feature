@all
Feature: Test the Wiki page on chrome Browser

@create @functional
Scenario: Test Create account on Wiki Page
Given User is on Main page 
Then User Enters username
And User enters Password

@login @functional
Scenario: Test Login link on Wiki Page
Given User is on Main page 
When User clicks on Login link
Then User clicks on checkbox on login Page
Then User clicks on Forgot your password? link
==============================================================================
package steps;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import io.cucumber.java.AfterStep;
import io.cucumber.java.Before;
import io.cucumber.java.BeforeStep;

public class BaseHooks {

	public static WebDriver driver;
	
	public void OpenBroweser()
	{
		System.out.println("Task 1: Open the Chrome Browser");
		driver = new ChromeDriver();
	}
	@Before(order=2)
	public void managebrowserwindow()
	{
		System.out.println("Task2: Manage browser window");
		driver.manage().deleteAllCookies();
		driver.manage().window().maximize();
	}
	@Before(order=2)
	public void openUrl()
	{
		System.out.println("Task3: Enter URL");
        driver.get ("https://en.wikipedia.org/w/index.php?title=Special:CreateAccount&returnto=Wikipedia%25253ASign+up");
        	
	}
	@BeforeStep
	public void stepstart()
	{
		System.out.println("The steps has startted execution");
	}
	@AfterStep
	public void stepend()
	{
		System.out.println("The steps has completed execution");
	}
	
	public void capturetitle()
	{
		System.out.println("Task4: Captturettitle");
		System.out.println(driver.getTitle());
	}
	
	public void closebrowser()
	{
		System.out.println("Task5: browser is now closed");
		driver.close();
	}
	public void Taskcompleted()
	{
		System.out.println("Task6: Test senario completed");
	}
}
=====================================================================
package steps;

import org.openqa.selenium.By;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class HooksStepsDemo  {
	
	
	@Given("User is on Main page")
	public void user_is_on_main_page() {
	   
		System.out.println("Yes, user is on the main page");
	}

	@Then("User Enters username")
	public void user_enters_username() {
	   BaseHooks.driver.findElement(By.xpath("//input[@id='wpName2']")).sendKeys("admin");
	}

	@Then("User enters Password")
	public void user_enters_password() {
		BaseHooks.driver.findElement(By.xpath("//input[@id='wpPassword2']")).sendKeys("admin@123");
	}

	@When("User clicks on Login link")
	public void user_clicks_on_login_link() {
		BaseHooks.driver.findElement(By.xpath("(//span[text()='Log in'])[1]")).click();
	}

	@Then("User clicks on checkbox on login Page")
	public void user_clicks_on_checkbox_on_login_page() {
		BaseHooks.driver.findElement(By.xpath("//input[@name='wpRemember']")).click();
	}

	@Then("User clicks on Forgot your password? link")
	public void user_clicks_on_forgot_your_password_link() {
		BaseHooks.driver.findElement(By.xpath("//a[text()='Forgot your password?']")).click();
	}

}

