using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Net;

namespace comp2007_s2016_team_proj
{
    public partial class Contact : System.Web.UI.Page
    {

        private SmtpClient client = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string companyEmail = "basetracker8jl@gmail.com"; // placeholder for company email
            string clientEmail = EmailTextBox.Text;

            sendEmail(clientEmail, companyEmail);
            sendNotifyEmail(companyEmail, clientEmail);

            Response.Redirect("/");
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            FullNameTextBox.Text = CompanyTextBox.Text = EmailTextBox.Text = PhoneNumberTextBox.Text = MessageTextBox.Text = "";
        }

        /**
         * Builds the SMPT client
         */
        private void buildSmtpClient()
        {
            client = new SmtpClient();

            client.Port = 25;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Host = "smtp.googlemail.com";

            client.EnableSsl = true;
            client.Credentials = new NetworkCredential("basetracker8jl@gmail.com", "keyboard8");
        }

        /**
         * Sends a thankyou email to the contact notifying that we recieved their message
         */
        private void sendNotifyEmail(string from, string to)
        {
            if(client == null)
                buildSmtpClient();

            MailMessage mail = new MailMessage(from, to);

            mail.Subject = "BaseTracker - Thank you for your help!";
            mail.Body = "We at BaseTracker care about what you have to say and want to thank you for your help and support!";

            client.Send(mail);
        }

        /**
         * Sends the email to BaseTracker regarding the information
         */
        private void sendEmail(string from, string to)
        {
            if (client == null)
                buildSmtpClient();

            MailMessage mail = new MailMessage(from, to);

            mail.Subject = "BaseTracker - Someone has contacted you!";
            mail.Body = "Contact Info: \r\n"
                + FullNameTextBox.Text + "\r\n"
                + CompanyTextBox.Text + "\r\n"
                + EmailTextBox.Text + "\r\n"
                + PhoneNumberTextBox.Text + "\r\n\r\nHas left the following message for you:\r\n"
                + MessageTextBox.Text;

            client.Send(mail);
        }
    }
}