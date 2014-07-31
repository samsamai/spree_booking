Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
                     :name => "add_booking_info1",
                     :insert_top => "[data-hook='inside_product_cart_form']",
                     :text => <<eos
                     <script>
                     function validate_booking_form(){
                       var adults = parseInt( $('input#adults').val() );
                       var children = parseInt( $('input#children').val() );
                       var seats_left = parseInt( $('#seats_left').text() );
                       if (adults + children > seats_left) {
                         alert('There are only ' + seats_left + " seats available." );
                         return false;
                       }
                       else {
                         return true;
                       }
                     }
                     $(document).ready(function(){
                       

                       if ( gon.book_now == "true") {
                         open_booking_modal();
                       }
                       
                       function qty_changed( element ) {
                         var adults = parseInt( $('input#adults').val() );
                         var children = parseInt( $('input#children').val() );
                         var seats_left = parseInt( $('#seats_left').text() );
                         if (adults + children <= seats_left) {
                           recalculatePrice();
                           $(element).attr('origvalue',$(element).val());
                         }
                         else {
                           $(element).val( $(element).attr('origvalue') );
                         }
                       }

                       function recalculatePrice() {
                         var master_price = parseFloat( $('[data-hook="booking-info"]').data('master-price') );
                         var new_price = master_price * $('input#adults').val() + master_price * $('input#children').val() * 0.55;
                         $('span.lead.price').text('$' + new_price.toFixed(2).toString() );
                       }
                       
                       function open_booking_modal() {
                         $.lazybox("<%= j(render partial: 'booking_form') %>", { opacity: 0.7, speed: 500 });
                         $.lazybox.close = function() {
                           $('body[data-hook="body"]').css('overflow', 'auto');
                           var overlay = $('#lazy_overlay');
                           overlay.css('overflow', 'hidden');
                           return overlay.removeClass('visible');
                         };

                         $('body[data-hook="body"]').css('overflow', 'hidden');
                         var overlay = $('#lazy_overlay');
                         var lazybox = $('#lazybox');
                         overlay.css('overflow', 'scroll');
                         lazybox.css('margin-top', 'auto');
                         lazybox.css('margin-bottom', 'auto');
                         
                         $("#adults").prop('disabled', true);
                         $("#children").prop('disabled', true);
                         $("#under4").prop('disabled', true);
                         
    
                         $('#booking_date').on('change', function(e){
                               var selectedDate = $(this).val(); 
                               $("#adults").val("1");
                               $("#children").val("0");
                               $("#under4").val("0");

                               $.ajax({
                               url     : '/products/seats_left',
                               type    : 'GET',
                               data    : { 'date' : selectedDate, 'product_id' : gon.product_id },
                               dataType: 'script'
                           });

                         });
                         
                         $('input#adults').on('keyup change', function(e){
                           // qty_changed( this );
                         });

                         $('input#children').on('keyup change', function(e){
                           // qty_changed( this );
                         });
                         
                         $("#booking_date").datepicker({
                           dateFormat: "dd-mm-yy",
                           beforeShowDay: function(date){
                               var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
                               return [ gon.disabled_dates.indexOf(string) == -1 ]
                           },
                           defaultDate: "+1w",
                           changeMonth: true,
                           numberOfMonths: 1,
                           minDate:0,
                           maxDate: '+6m'
                         });
                         $("input#variant_id").val( gon.variant_id );
                         $("#make-booking input").prop('disabled', true);
                       }
                       
                       $('a#lazy_close').bind( "touchstart", function(e){
                         e.preventDefault();
                         $.lazybox.close();
                         });
                       
                       
                       $('a#book-now').bind( "touchstart", function(e){
                         e.preventDefault();
                         open_booking_modal();
                         });
                       $('a#book-now').click(function(e){
                         e.preventDefault();
                         open_booking_modal();
                       });
                     })
                     </script>
eos
)            

# Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
#                      :name => "add_booking_info2",
#                      :insert_top => "#product-price",
#                      :text => <<eos
#
# <a id='book-now' class="button btn btn-primary" href="#">Book Now</a>
# <h6><%= Spree.t(:seats_left) %>
# </h6>
#   <span id="seats_left">
#     <%= @available_bus.nil? ? 'No seats available.' : @available_bus[:seats_left ] %>
#   </span>
#
# eos
# )

Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
                     :name => "add_booking_info3",
                     :replace_contents => "div.add-to-cart",
                     :text => <<eos
                     <%= hidden_field_tag :quantity, 1, :class => 'title', :min => 1 %>
                     <%= button_tag :class => 'large primary', :id => 'add-to-cart-button', :type => :submit do %>
                       <%= Spree.t(:add_to_cart) %>
                     <% end %>
eos
)            

