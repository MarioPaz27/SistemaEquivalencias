<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SistemaEquivalencias.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <!--Cuerpo del sistema-->
    <div class="wrapper row3">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
      <h1><%: Page.Title %></h1>
    <p>Vestibulumaccumsan egestibulum eu justo convallis augue estas aenean elit intesque sed. Facilispede estibulum nulla orna nisl velit elit ac aliquat non tincidunt. Namjusto cras urna urnaretra lor urna neque sed quis orci nulla. Laoremut vitae doloreet condimentumst phasellentes dolor ut a ipsum id consectetus. Inpede cumst vitae ris tellentesque fring intesquet nibh fames nulla curabitudin.</p>
    <ul>
      <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
      <li>Etiam vel sapien et est adipiscing commodo.</li>
      <li>Duis pharetra eleifend sapien, id faucibus dolor rutrum et.</li>
      <li>Donec et dui dolor, in lacinia leo.</li>
      <li>Mauris posuere tellus ac purus adipiscing dapibus.</li>
    </ul>
    <p>Vestibulumaccumsan egestibulum eu justo convallis augue estas aenean elit intesque sed. Facilispede estibulum nulla orna nisl velit elit ac aliquat non tincidunt. Namjusto cras urna urnaretra lor urna neque sed quis orci nulla. Laoremut vitae doloreet condimentumst phasellentes dolor ut a ipsum id consectetus. Inpede cumst vitae ris tellentesque fring intesquet nibh fames nulla curabitudin.</p>
    <ol>
      <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
      <li>Etiam vel sapien et est adipiscing commodo.</li>
      <li>Duis pharetra eleifend sapien, id faucibus dolor rutrum et.</li>
      <li>Donec et dui dolor, in lacinia leo.</li>
      <li>Mauris posuere tellus ac purus adipiscing dapibus.</li>
    </ol>
    <!-- ####################################################################################################### --> 
  </div>
</div>

    <!--Pie de pagina con informacion del sistema-->
    <div class="wrapper row4">
  <div id="footer" class="clear"> 
    <!-- ####################################################################################################### -->
    <div class="footbox">
      <h2>Quick Links</h2>
      <ul>
        <li><a href="#">&raquo; Homepage</a></li>
        <li><a href="#">&raquo; Contact Us</a></li>
        <li><a href="#">&raquo; Sitemap</a></li>
        <li><a href="#">&raquo; Privacy Policy</a></li>
        <li><a href="#">&raquo; Terms of Use</a></li>
        <li><a href="#">&raquo; Copyright Information</a></li>
        <li><a href="#">&raquo; Website Matters</a></li>
      </ul>
    </div>
    <div class="footbox">
      <h2>How To Find Us</h2>
      <address>
      Address Line 1<br />
      Address Line 2<br />
      Town/City<br />
      Postcode/Zip<br />
      <br />
      Tel: xxxx xxxx xxxxxx<br />
      Email: <a href="#">contact@domain.com</a>
      </address>
    </div>
    <div class="fl_right">
      <div id="social">
        <h2>Connect With Us</h2>
        <ul>
          <li><a href="#"><img src="../images/social/facebook.gif" alt="" /></a></li>
          <li><a href="#"><img src="../images/social/twitter.gif" alt="" /></a></li>
          <li><a href="#"><img src="../images/social/flickr.gif" alt="" /></a></li>
          <li><a href="#"><img src="../images/social/youtube.gif" alt="" /></a></li>
          <li class="last"><a href="#"><img src="../images/social/rss.gif" alt="" /></a></li>
        </ul>
      </div>
      <div id="newsletter" class="clear">
          <fieldset>
            <legend>Subscribe To Our Newsletter:</legend>
            <input type="text" value="Enter Email Here&hellip;" onfocus="this.value=(this.value=='Enter Email Here&hellip;')? '' : this.value ;" />
            <input type="text" id="subscribe" value="Submit" />
          </fieldset>
      </div>
    </div>
    <!-- ####################################################################################################### --> 
  </div>
</div>
</asp:Content>
