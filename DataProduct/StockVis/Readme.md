This Shiny application demonstrates Shiny's automatic UI updates. THe application is based on the Shiny website demo example. 

The application displays a stock's historic values using Google financial service. To run this program, the folder "StockVis" needs to be copied to your work directory.

Inside R Studio,

1. Copy folder "StockVis" into your work directory.
2. Install.Packages("quantmod").
3. Install.Packages("downloader").
4. Install.Packages("shiny").
5. Launch the app with runApp("StockVis").

Once the app is run, the UI allows you to input the stock symbol, date range, and an option of whether or not to correct prices for inflation. The plot shows the historic stock prices and its volumn as a function of the date.



