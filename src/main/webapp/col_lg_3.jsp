<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <div class="col-lg-3 ds">
            <!--COMPLETED ACTIONS DONUTS CHART-->
            <h3>NOTIFICATIONS</h3>

            <!-- First Action -->
            <div class="desc">
                <div class="thumb">
                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                </div>
                <div class="details">
                    <p>
                        <muted>2 Minutes Ago</muted>
                        <br/>
                        <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                    </p>
                </div>
            </div>
            <!-- Second Action -->
            <div class="desc">
                <div class="thumb">
                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                </div>
                <div class="details">
                    <p>
                        <muted>3 Hours Ago</muted>
                        <br/>
                        <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                    </p>
                </div>
            </div>
            <!-- Third Action -->
            <div class="desc">
                <div class="thumb">
                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                </div>
                <div class="details">
                    <p>
                        <muted>7 Hours Ago</muted>
                        <br/>
                        <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                    </p>
                </div>
            </div>
            <!-- Fourth Action -->
            <div class="desc">
                <div class="thumb">
                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                </div>
                <div class="details">
                    <p>
                        <muted>11 Hours Ago</muted>
                        <br/>
                        <a href="#">Mark Twain</a> commented your post.<br/>
                    </p>
                </div>
            </div>

            <!-- CALENDAR-->
            <div id="calendar" class="mb">
                <div class="panel green-panel no-margin">
                    <div class="panel-body">
                        <div id="date-popover" class="popover top"
                             style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                            <div class="arrow"></div>
                            <h3 class="popover-title" style="disadding: none;"></h3>
                            <div id="date-popover-content" class="popover-content"></div>
                        </div>
                        <div id="my-calendar"></div>
                    </div>
                </div>
            </div><!-- / calendar -->

        </div>
    </body>
</html>