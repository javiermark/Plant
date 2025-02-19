<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Plantito</title>
                <link rel="stylesheet" type="text/css" href="styles.css"/>
            </head>
            <body>
                <div class="container">
                    <div class="form-section">
                        <h3>Click on a plant to display its information.</h3>
                        <label>Common</label>
                        <input type="text" id="common" readonly="true"/>
                        
                        <label>Botanical</label>
                        <input type="text" id="botanical" readonly="true"/>
                        
                        <label>Zone</label>
                        <input type="text" id="zone" readonly="true"/>
                        
                        <label>Light</label>
                        <input type="text" id="light" readonly="true"/>
                        
                        <label>Price</label>
                        <input type="text" id="price" readonly="true"/>
                        
                        <label>Availability</label>
                        <input type="text" id="availability" readonly="true"/>

                        <div class="button-group">
                            <button class="save">Save</button>
                            <button class="add">Add</button>
                            <button class="delete">Delete</button>
                            <button class="reset">Reset</button>
                        </div>
                    </div>

                    <table id="plantTable">
                        <tr>
                            <th>Common Name</th>
                            <th>Botanical Name</th>
                            <th>Zone</th>
                            <th>Light</th>
                            <th>Price</th>
                            <th>Availability</th>
                        </tr>
                        <xsl:for-each select="plants/plant">
                            <tr onclick="displayPlant(this)">
                                <td><xsl:value-of select="common"/></td>
                                <td><xsl:value-of select="botanical"/></td>
                                <td><xsl:value-of select="zone"/></td>
                                <td><xsl:value-of select="light"/></td>
                                <td><xsl:value-of select="price"/></td>
                                <td><xsl:value-of select="availability"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>

                <script>
                    function displayPlant(row) {
                        document.getElementById("common").value = row.cells[0].innerText;
                        document.getElementById("botanical").value = row.cells[1].innerText;
                        document.getElementById("zone").value = row.cells[2].innerText;
                        document.getElementById("light").value = row.cells[3].innerText;
                        document.getElementById("price").value = row.cells[4].innerText;
                        document.getElementById("availability").value = row.cells[5].innerText;
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
