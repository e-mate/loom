<g:applyLayout name="main">
    <div class="wrapper">
        <div class="content-wrapper" id="training-content-wrapper">
            <section class="content-header">
                <div class="row">
                    <div class="col-md-1"></div>

                    <div class="col-md-10">
                        <g:render template="/home/alert-templates"/>
                        <h1 id="training-name">${simulation.name}</h1>
                        <g:hiddenField name="training" value="${simulation.id}"/>
                    </div>

                    <div class="col-md-1"></div>
                </div>
            </section>

            <section class="content-header">
                <div class="row">
                    <div class="col-md-1"></div>

                    <div class="col-md-10">
                        <div class="box box-success box-solid">
                            <div class="box-header with-border">
                                <h3 class="box-title">Story</h3>
                            </div>

                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-3 border-right">
                                        <g:each in="${room?.users}" var="user">
                                            <button class="btn btn-block btn-info">${user.alias}</button>
                                        </g:each>
                                    </div>

                                    <div class="col-md-9 border-left table-bordered"
                                         style="min-height: 200px !important;">
                                        <ul id="dvSource">
                                            <g:each in="${tts}" var="tt">
                                                <li class="ui-state-default" id="${tt.id}">${tt.text}</li>
                                            </g:each>
                                        </ul>
                                    </div>
                                </div>
                                <hr/>

                                <div class="row"></div>

                                <div class="row">
                                    <div class="col-md-1"></div>

                                    <div class="col-md-10 table-bordered ui-widget-content" id="dvDest">
                                        <ul style="min-height: 200px !important;">
                                            <li class="placeholder">Add tails here</li>
                                        </ul>
                                    </div>

                                    <div class="col-md-1"></div>
                                </div>

                                <hr/>

                                <div class="row">
                                    <div class="col-lg-9"></div>

                                    <div class="col-lg-3" id="btn-panel">
                                        <button type="submit" class="btn btn-success"
                                                id="submit-training">Submit</button>
                                        <button type="reset" id="reset-training" class="btn btn-default">Reset</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-1"></div>
                </div>
            </section>
        </div>
    </div>
</g:applyLayout>