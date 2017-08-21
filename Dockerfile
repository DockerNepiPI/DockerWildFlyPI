# Use raspbian from manicmonkey as the base
FROM manicmonkey/raspbian-jdk8

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 10.1.0.Final
ENV WILDFLY_SHA1 9ee3c0255e2e6007d502223916cefad2a1a5e333
ENV WILDFLY_HOME /opt/wildfly
ENV WILDFLY_USER admin
ENV WILDFLY_PW admin

USER root

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN cd $HOME \
    && wget https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
    && sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 \
    && tar xf wildfly-$WILDFLY_VERSION.tar.gz \
    && mv $HOME/wildfly-$WILDFLY_VERSION $WILDFLY_HOME \
    && rm wildfly-$WILDFLY_VERSION.tar.gz \
    && $WILDFLY_HOME/bin/add-user.sh $WILDFLY_USER $WILDFLY_PW --silent \
    && adduser --system --shell /bin/bash --group wildfly \
    && chown -R wildfly:0 ${WILDFLY_HOME} \
    && chmod -R g+rw ${WILDFLY_HOME}

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

USER wildfly

# Expose the ports we're interested in
EXPOSE 8080
EXPOSE 9990

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]