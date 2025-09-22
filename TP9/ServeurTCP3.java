import java.io.*;
import java.net.*;

public class ServeurTCP3
{
	public static void main( String args[] )
	{
		try{
			ServerSocket socketserver = new ServerSocket(1234);
			System.out.println("serveur en attente");
			while (true) {
				Socket socket = socketserver.accept();
				System.out.println("Connection d'un client");
				DataInputStream dIn = new DataInputStream(socket.getInputStream());
				DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
				String msg = dIn.readUTF();
				System.out.println("Message: " + msg);
 				String rev = new StringBuilder(msg).reverse().toString();
				dOut.writeUTF(rev);
                System.out.println("Message de réponse: " + rev);
				dIn.close();
                dOut.close();
				socket.close();
			}
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
