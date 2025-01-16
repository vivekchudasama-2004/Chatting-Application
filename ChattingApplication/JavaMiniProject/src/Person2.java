import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.xml.validation.Validator;
import java.awt.*;
import java.awt.event.*;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.net.*;

public class Person2  implements ActionListener {
    JTextField Text ;
    JPanel A1;
    static DataOutputStream Dout;
     static  Box Vertical =Box.createVerticalBox();
      static JFrame F = new JFrame();
    Person2(){
        // creating the panel on the define size screen
        F.setLayout(null);
        JPanel j1 = new JPanel();
        j1.setBackground(new Color(7, 94, 45));
        j1.setBounds(0,0,450,70);
        j1.setLayout(null);
        F.add(j1);

        //back arrow icon set
        ImageIcon i1 = new ImageIcon("Icon/BackArrow.png");
        Image i2 = i1.getImage().getScaledInstance(25, 25, Image.SCALE_DEFAULT);
        ImageIcon i3 = new ImageIcon(i2);
        JLabel back = new JLabel(i3);
        back.setBounds(5, 20, 25, 25);
        j1.add(back);

        //  BAck arrow used for exit the chat
        back.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent ae) {
                System.exit(0);
            }
        });

        //setting the profile picture on the panel
        ImageIcon i4 = new ImageIcon("Icon/DProfile.png");
        Image i5 = i4.getImage().getScaledInstance(55, 55, Image.SCALE_DEFAULT);
        ImageIcon i6 = new ImageIcon(i5);
        JLabel D_P = new JLabel(i6);
        D_P.setBounds(40, 10, 50, 50);
        j1.add(D_P);

        //Set name on the panel
        JLabel name = new JLabel("Deep Tapodhan");
        name.setBounds(110,13,150,20);
        name.setForeground(Color.WHITE);
        name.setFont(new Font("TIMES_NEW_ROMAN ",Font.BOLD,18));
        j1.add(name);

        //Active Status
        JLabel Status = new JLabel("Active now");
        Status.setBounds(110,35,150,20);
        Status.setForeground(Color.WHITE);
        Status.setFont(new Font("TIMES_NEW_ROMAN ",Font.BOLD,14));
        j1.add(Status);

        //chatting panel area set
        A1 =new JPanel();
        A1.setBounds(5,70,440,490);
        F.add(A1);

        //Text writing area set and accepting input in it
        Text = new JTextField();
        Text.setBounds(5,563,310,40);
        Text.setFont(new Font("TIMES_NEW_ROMAN",Font.PLAIN,15));
        F.add(Text);

        // Set Send Button for Sending message
        JButton Send = new JButton("Send");
        Send.setBounds(300,563,123,40);
        Send.setBackground(new Color(7,94,84));
        Send.addActionListener(this);
        Send.setForeground(Color.WHITE);
        F.add(Send);





        // setting the dimension of the pop-pop Window
        F.setSize(450,700);
        F.setLocation(200,50);
        F.getContentPane().setBackground(Color.WHITE);

        F.setVisible(true);
    }
    // main method
    public static void  main(String [] args) throws IOException {

        new Person2();

        try {
            ServerSocket skt =new ServerSocket(2024);
            // while loop true to accept the message from the Person1
            while(true){
                Socket s = skt.accept();
                DataInputStream Din = new DataInputStream(s.getInputStream());
                Dout = new DataOutputStream(s.getOutputStream());

            while(true) {
                String Msg = Din.readUTF();
                JPanel panel = formatLabel(Msg);

                JPanel Left = new JPanel(new BorderLayout());
                Left.add(panel,BorderLayout.LINE_START);
                Vertical.add(Left);
                F.validate();
            }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override

    //action to be performed on click on the send button
    public void actionPerformed(ActionEvent e) {
        try {
            String out = Text.getText();
            JLabel output = new JLabel(out);

            // creating the new panel for send message display
            JPanel j2 = formatLabel(out);


            A1.setLayout(new BorderLayout());
            JPanel Right = new JPanel(new BorderLayout());

            //for printing messages at the end of the line
            Right.add(j2, BorderLayout.LINE_END);

            //for printing messages vertically
            Vertical.add(Right);

            //Space btw two message
            Vertical.add(Box.createVerticalStrut(15));
            // align the vertical
            A1.add(Vertical, BorderLayout.PAGE_START);

            Dout.writeUTF(out);

            Text.setText("");

            F.repaint();
            F.invalidate();
            F.validate();
        }
        catch (Exception a ){
            a.printStackTrace();
        }
    }

    public  static  JPanel formatLabel(String out){
        JPanel panel =new JPanel();
        panel.setLayout(new BoxLayout(panel,BoxLayout.Y_AXIS));

        JLabel  output = new JLabel(out);
        output.setFont(new Font("AVENIR_NEXT",Font.PLAIN,16));
        output.setBackground(new Color(156, 228, 140));
        output.setOpaque(true);

        output.setBorder( new EmptyBorder(15,15,15,50));
        panel.add(output);


        // Time of message was sent
        Calendar calen =Calendar.getInstance();
        SimpleDateFormat DFormat = new SimpleDateFormat("HH:mm");

        JLabel Time = new JLabel();
        Time.setText(DFormat.format(calen.getTime()));
        panel.add(Time);
        return panel;
    }


}
