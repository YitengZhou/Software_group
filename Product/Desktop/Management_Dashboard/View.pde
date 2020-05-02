PImage img;

void updateDashboardData() {

        int text_x_size = 225;
        int text_y_size = 150;  
        int label_spacing = 35;
        int userinfo_x_pos = 350;
        int userinfo_y_pos = 100;
        int textbox_spacing = 50;

        view.build_list("user", null);
        view.set_filename("pet.png");
        view.build_userinfomation("bebe1230", "beibei", "liu", "pet pet", "100", "idk" );
        view.build_statisticsinformation("12,345", "high", "54,321", "9,876");
        view.build_labels("userinfo_label" ,"User Infomation", userinfo_x_pos, userinfo_y_pos - label_spacing, 25);
        view.build_labels("statsinfo_label" ,"Statistics", userinfo_x_pos + text_x_size + textbox_spacing, userinfo_y_pos - label_spacing, 25);
        view.build_labels("dailychart_label" ,"Bar Chart (hourly)", 140, 350, 25);
        view.build_labels("weeklychart_label" ,"Bar Chart (weekly)", 560, 350, 25);
        view.build_dailychart(new float[] {100, 150, 200, 250, 300, 350, 300, 120}, 
                new String[] {"00:00","03:00","06:00", "09:00","12:00", "15:00", "18:00", "21:00"});
        view.build_weeklychart(new float[] {100, 150, 200, 250, 300, 350, 400}, 
                new String[] {"Mon","Tue","Wed", "Thur","Fri", "Sat", "Sun"});

}
 
// The main class which contains the dynamic build of the dashboard. Advantage being more metrics can be added with ease. 
public class Dashboard_view {

        String img_filename;
        int text_x_size = 225;
        int text_y_size = 150;  
        int userinfo_x_pos = 350;
        int userinfo_y_pos = 100;
        int textbox_spacing = 50;
        int display_photo_x_size = 200;
        int display_photo_y_size = 200;
        int display_photo_spacing = 75;

        //Building top-left display photo for users

        void set_filename(String filename) {
                img_filename = filename; 
        }

        void build_profilephoto() {
                img = loadImage(img_filename);
                img.resize(200, 200);
                image(img, userinfo_x_pos - display_photo_spacing - display_photo_x_size, userinfo_y_pos - 50);
        }

        //Building Barchart

        void build_dailychart(float[] data, String[] label) {
                dailychart.setData(data);
                dailychart.setMinValue(dailychart.getMinValue());
                dailychart.setMaxValue(dailychart.getMaxValue());
                dailychart.showValueAxis(true);
                dailychart.setBarLabels(label);
                dailychart.showCategoryAxis(true);
        }

        void build_weeklychart(float[] data, String[] label) {
                weeklychart.setData(data);
                weeklychart.setMinValue(weeklychart.getMinValue());
                weeklychart.setMaxValue(weeklychart.getMaxValue());
                weeklychart.showValueAxis(true);
                weeklychart.setBarLabels(label);
                weeklychart.showCategoryAxis(true);
        }

        //Title for Textboxes and Charts

        void build_labels(String label, String label_name, int x_pos, int y_pos, int font_size) {
                cp5.addTextlabel(label)
                .setText(label_name)
                .setPosition(x_pos, y_pos)
                .setColorValue(0xffffff00)
                .setFont(createFont("Georgia", font_size));
        }

        // Textbox for Userinfo and general statistics

        void build_userinfomation(String username, String firstname, String lastname, String petname, String petlevel, String skin) {
                cp5.addTextarea("userinfo")
                .setPosition(userinfo_x_pos, userinfo_y_pos)
                .setSize(text_x_size, text_y_size)
                .setFont(createFont("arial",17))
                .setLineHeight(20)
                .setColor(color(180))
                .setColorBackground(color(255,100))
                .setColorForeground(color(255,100))
                .setText("User Name: " + username + "\n"
                +"First Name: " + firstname + "\n"
                +"Last Name: " + lastname + "\n"
                +"Pet Name: " + petname + "\n"
                +"Pet Level: " + petlevel + "\n"
                +"Skin: " + skin + "\n"); 
        }

        void build_statisticsinformation(String steps, String activitylevel, String weeklystep, String averagestepdaily) {
                cp5.addTextarea("statsinfo")
                .setPosition(userinfo_x_pos + text_x_size + textbox_spacing, userinfo_y_pos)
                .setSize(text_x_size, text_y_size)
                .setFont(createFont("arial",17))
                .setLineHeight(20)
                .setColor(color(180))
                .setColorBackground(color(255,100))
                .setColorForeground(color(255,100))
                .setText("Steps: " + steps + "\n"
                +"Activity Level: " + activitylevel + "\n"
                +"Weekly Step: " + weeklystep + "\n"
                +"Average Step Daily: " + averagestepdaily + "\n");      
        }

        void build_list(String list_name, JSONObject users) {
                ScrollableList list = cp5.addScrollableList(list_name)
                .setPosition(0, 0)
                .setSize(100, 100);
                list.setBackgroundColor(color(190));
                list.setItemHeight(20);
                list.setBarHeight(40);
                list.setColorBackground(color(60));
                list.setColorActive(color(255, 128));
                list.clear();
                list.open(); 
                
                //for loop to add all users
              
                
        }
}
