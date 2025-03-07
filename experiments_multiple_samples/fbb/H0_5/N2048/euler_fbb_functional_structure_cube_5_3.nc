CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T103742        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.5</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?b"�[φ?�tK�T?���գz1?�\�鞩?�=�{�L�?��?���?�+#�2=;?���7b�L?��]�c&@�"��$p@h�Q"(�@�Wx@1���@VʨB��@�ߤ[@m4��@^��k~'@!ʁ�$�@$�4}x8@&g�}�l�@(�bf��@+�����@.VU����@0����@2%�fWu@3����na@5d~(�v�@7ߌ��9@8��ܤ�x@:�����j@<���1-@>�X�3)#@@Y��04�@Ah��?@B�<��4�@C�����@D�T�fw@F �^��q@G=��K�\@H�`�̠�@I��)#�@K-;13��@L���Ae@M�����]@Op�)U״@Pwʑ��@Q;�SBm@R�E���@R�;O:�@S��m��@T{�uA�6@UW�M%FY@V8j
	K@WY��K@X��`��@X�H`�ܪ@Y��e�O�@Z�W�W��@[���~Y@\�K�|@]�CFj;s@^�ˑ�p@`		d�C        ?5���c?o��S��.?�k�$p?���2��?����а?��,���R?�,��	�?�G��N�?�$��-��?۶��y6.?��T:8�?�Q�.T̓?�p�v�?���2��?􈟩��?��-���?�b���@`O�|�@g19�X @���	�@��-��V@�$�"��@9�o�Un@��í��@�����}@��� ��@����%G@ �x%@��@"�u��h@$��~n��@'-�s�I@)�@�5<-@,A�`�д@/���@1-;��@2�U04�@4F���J�@6
�ܛ�@7�Ǿ���@9��W��@;���f@>@�e1@@$���@AN���S2@B�z�=��@C�٣r��@Eb���h@F{pD�@G�i7`�#@Ic�w�,@J��s8�<@L�xi廒@N0؟���@Oꏽ�*8@PڌpJ� @Q�uJ�Y�@R�;ZR@S��Y8@T�<���@U��z���@V�L٦ݶ@X��b5�@YNN��        ?k����?�+�i��l?�1A��?�����I)?�To"*�?�k�P��z?����b˥?���>�'�@��җ@
�M�#U�@�Ų�E�@4P58�@�kV��@�����@ O칩1@"���L��@%a�ػ63@(2z�ezY@+5+�f!@.lQ��1�@0�6Kh�o@2�7}@4�%�#�v@6��w��h@8���!��@;L��f{@=ŵ�1�R@@1��@A�;d��@C
i�h@�@D�:*g�@F4�C#@G�q�){�@I�R���0@K�$�yK@M�}-�Ф@O��� �@P�xё�@R
��
��@S9�Z��@Tu�4��@U�5��
@W�oQE@XzTd�˿@Y�c�k,@[lI�t�@\�,ü">@^�6Y��@` K~�Q@`���/f@a��ʪ\�@b��ܔ;@c�etI@d���Wx2@e��Q�r�@f�S�j��@g�3���@h�R�l��@jѢ�@kD���t@lyq���@m��R��@n��        ?�
�^;�|@��$�@�@$�,+@8ԉbf��@G����@S���RW@]t6���@d�؏G#@k4]A�)J@qd��|�'@u�p(!s�@zR��W-�@v��� ~@���bGµ@��$�꺴@���q��@�BȨj�@���F�Y@��� Y@� ��P�@�.��a��@�y�W�@�߰�K�]@�bC��&Q@� E!��@�]g���@��a����@�?H���@���`�@�Vv�,2�@��-��U@��K�_J@�]�hj�-@�&#�#h@����@�����xz@���h`@���҄@��т��@��n��@�+�j@�-��L�
@�P@?m�:@�y}W�0@��q��@���5\=@�E��U@�ap�
@��JD�.@�}�sFtU@�)��u��@��N�]�@=8툸@�?W�ќ�@���d@ĳ"t�?@�q�tF |@�3cp�dK@��L�m��@��`Z�U@ȋ�8�l@�Z���@�+�u�Z        ?3s81�/�?l��$٤�?����va�?��E�c�1?��G�ߖ?�����?���� m�?�\�e���?��hݾ�?���p�?�D���?���;g�?�!O-%�?����5�W?�D�?�gL>@�?�wX��@  ��uG�@�p��@e�wrA@��r��@	m���@/Q��eG@խP�@t8�b}@�B�J�@p�1-�@:j�]o�@ʑ��	@
�E�5�@���ڏ@(^[&p@ *&|P�/@!J4(q�@"t��p*�@#�?ȑ�@$�Ľ/�@&7q����@'��L��@(��@^�@*ds�c@+�w�0�b@-i*��>6@.�G2�@0O�� .�@1':[��7@2�a�uh@2�@64@�@3�$}е�@4Ť��@5���y��@6�v[,�3@7��t��@8��L�@9�m���@:���%+S@<��$\@=@�M���@>n�#�f@?�,;R�@@nyS`�@A1��@A�Dy�AF        ?%^�,k�~?a��HjZc?�$��A?������?��ݓRa�?�ڏ�i�?���`�8�?Ƌ�O�s?��E���?��D"3�D?�^^ju9?߭͟c@?�{8DB��?��;���?�zQ�+� ?���x��B?��N!�?����SkN?��s	5��@ "����@��A1�7@��\��@�	C1@PF	Y�@�c�>@J�U�ߩ@�Jx�*�@JK+�D�@%S}���@A��6@ Qa����@"%��M.@$MR�[R@&?���@(�����H@*��W9�@-�1m"�
@0#�*Wu�@1��Pk\m@3��� @4��f���@6n$��ͺ@86%�I�:@:�s��@<V,ׇL@>�!C@@)�"��@A67P��@B]�WE�U@C��*�@D����@FA���@Gni�!��@H�?ؑP,@J;��eF�@K�C��[�@M6rC��=@N�H�@P/��&�	@Qx�kp�@Q�%�po+@R��l���@S�@,�(6        ?��)%�/?A�g2
�?bEP�4`�?w��_��?�~��S¤?��-�mw>?�){���?�������?�d�TFy�?�`�!�?�=\}�/�?�����d�?��N|!?�!�˭�?�B����?�h-g�Ȃ?�ٟw1��?�#��n"?�#�\,�@?���Oo�?�I-���n?��Â�?�`ٚ[��@ �x����@V��Q@aK�n�@	�4��Y�@���@?�@�a�``@�M;^@��^D�@E��֎@6����@g��\�@ 턮I�m@"��O�`@$ʝvK@&�YGY�@)>ƞ��@+�D�Rћ@.V�pM�@0�RF}��@2J\���@3����0f@5OZ�\e�@7��=@8��.�@:4� @=J$i�@?6%��k�@@�_C�@A��M�K@C>���k@D���g��@E�A֤�@Goi,�@H��!w�8@J��P��G@L7��?b@M�%@O��f��@PШr��@Qʭ���<        ?����ZZ?�$`!�,�?�]��i/�@G,�V��@&�%6@)L;�.#@3,y&�@;�rVV~@Bw)/_�@GL/��)�@M#7��Y�@Q����*L@UZ���<�@Y9�*,V@]k����@`�v�N�@ce�K��n@e��G�	�@h�b�7u@k�῏�@n��	�&@q����@r���ͮ@t�X˄9D@v�CU��@x�|�<{�@z�.b4@|�o�|�@<�
H{@��3���T@� �@�('@�?*�ܙ�@��W��E�@���D�O@�1���VT@��t����@�����@����)��@��'��@��?�Z@�&AKjҠ@�����Wi@��W�c s@��n�Q@��T��\@��%8���@�����m�@����ߝ@��ꐏ�3@���]Xs@��ԒI�@�� #�@��Ϋ�@�@�C���@�s#BBԶ@��c��8@@�v0@�+�@�� +��@��6d3��@�j1)�u�@�r4��@���l?a@�{����k        ?[�^6��V?�����M?�	o��?�?�냅`C�?� 6�2�?��=�W�?�Q���?�>ұ	%�?����TW?���V!@po2��e@����
�@��5�D@��w�@@���9�@��~��@�����@�\��@���'9@!�{�c�M@#�~�Q�@%���L�@'�(UL�@*R �Ǻ�@,��KJ@/S	p��y@0��]oO�@2d>�	�@3׍��C�@5Y�A�)@6�C�v�@8�ıj�(@:8�l�#@;�Wӭ��@=��O��@?���WQ@@�f�zs@A���m��@B�"μ"@C��7C�O@D�E���@E�Ͷ�B~@G  �W7@HJ���v@I{y ���@J��0!<@K�Xlq~o@M=�C��@N�.�~\@O�R���b@P�'TI�@QWPU�@R�!i�@Rʟ6d�@S�;�`�@TM���M@U�X@U�<x:�q@V�Bp~|�@W��Z9@XX�:#}@Y3B�@Z�a�        ?E��ӱ�;?�6��B�?� ��=B�?��zU7�?����~?���8��v?�
�<>?�	_z�"?�Kͭ9Y?�RȎ���?���L6@?��Q�v?�7Hy�?� xLY�\@�Vb���@�7�t,�@�`�W@k��"O�@X����k@�!��@-f��@�yY�@��sk�@�J����@��=��@!�js��Z@#�R���7@%ąA�U@(��!�@*pv&4\@-�v��@/�z/�@1cϕā^@2�����@4��6B@6p#|���@8T`���@:T�-�%�@<q, c�?@>�j��@@�S4���@A�YAݰ2@C����@DaAQ>l@E�����@GF�ە��@Hҫl(�@Jo�ќt@L���b�@Mߊ�!��@O��@P���J�@Q���B�@R�m��@S�G�՛@T���F�@V$[5!��@WU�QDR@X���$��@Y��Q��@[+���6V@\��->!�@]�k��N�        ?`mR�?�I_�ocK?�n���?�W�
]6%?�c�?6��?��3�A?��E�҂~?�W֑/�f?��1�Fa?�a��Ro�@D�N��>@:y>�T@
�����@P߫~��@;��+�@��7��@�d��@ApUak@���EY:@!9/�i٤@#6Դ��i@%Wmǫ�=@'���YA�@*�`���@,�2�րK@/U�Ȃ�@1��L@2�P=��@4Gk[��z@5�7�phU@7ϊô;�@9�=��oM@;�-��9�@=�9؊��@@���1{@A7��r]r@BrW	�@C�X���@E����@F�=om@G��Dl`<@I�4L�@K I@L͋1I��@N�&�x��@P/�Re��@Q"{��f@R,��_�@S&eN�4@T7}���@US���	d@Vz�G�>2@W�L���a@X�>n9"@Z4�{ֿ@[���_=@\�q{��@^Z�ݙи@_��u�@`��`��@ay���@bK{�<Q@c$#��b        ?��ߌ~�@']ݻE @ ���u"@4Be&-�^@CIS���@O���i�Q@Wn�_��@`B�U�@�@e�(B�m4@kozR�Z=@q���w@t�У�n@x�č��C@|�}P��@���7�9�@�Rʋ!�@���!��@��X෡@�ސ$�&@�N����@�7/K�=@��fR��@����:"@�Ɂ:i��@��kA֟@��q���@�#ˉ�I�@�neN$�@��:,�vO@�"^�LH@�hy@�iq@���' 1�@����Ʊ@�|~����@��b.\
�@�k/A1j�@����-օ@��fm�@�"�U�\:@�ea�XR�@�>��@�@�]^�v�@�@a>l�@��\!cm�@�ج;i�
@��/�'�c@����C@����x1@�����{@��;�f�8@�ۭ<��@��:-_Kx@��z@�"oEB*@�C�I�|�@�52�A��@���>g�@�b�Kiv@��5����@��f��@�8���G@��P�T��@�}�[��        ?2���cv�?i�_�uXq?���{�
�?�9���Z�?� ~٠_�?�	�o6?�-�|ej�?ω;��uy?�L���T?۰5����?�z�����?含i�?�����?�!>�!y�?�Ps�Dr�?�N���@
?��\��3�?���u?��׽���@��ƌO@�b��@S�J��@��Չ2@G����@�8�
�@c��Ѵ�@�eif�K@jT�ٝQ@��>��@��H�?�@v�w���@H���Q�@+��l�0@ N�dT@ +݈��@!��HM(@"3k0�	@#P�!-��@$vH@ɦ@%�p�m$/@&��AV@(���=]@)`_^���@*�A�#�@,A�כ�@-eq��3�@.�����@0`M��p@0ڌpy#�@1�v\��@2_���.@3)^�]�@3�dQr/@4��o�I@5��t�&,@6}���#@7_R�Lw@8E��O<�@91$���@:!ͧ�,�@;�]�m�@<Η�@=ߑ2        ?:4hʋ%?W� 4{��?zUN+�B?�~Ʈ�$�?�����?���8�9�?��.�F�?��*S�H?�}
F��?�%�xY�?���u�>?�i�<�-?ߙ��}��?�aAhR?�~��Ē:?�2�9�m�?��P�f�?��j�T��?�/�����?��k��N�?�8(��>@��;A�@�6_�ݍ@hS����@
�j���>@�� ���@�M���@�'M7c�@g��J
@y*��8@��|c@����@�t��E@!�����@#<����8@%��ݣH@'�_}��@)(kw�-@+g��0�@-�Ԯq+@0*�-K]�@1�L�5�;@2��(�RC@4w�`��@6/�ޭ@7�`V�$�@9�|)��s@;xXح�I@=x�D��@?�(�*�@@���^k@B0E���@CL����?@D���=�r@E����@G\]Ni�@H�*�d#@Je�q)Q@LDؐ�@M����E@O~����@P�_���@Q���U�y        ?WpE�C?I�ۺ��?i��\)�S?���(�)?���l]`?�� X�tS?�{�^�X?�n0��K�?��F �e}?����;�?Ƴ�st�?ͽ�e)?�$��ڱ�?�D��c0N?�Yp�P'Y?���s��?��Ѷ0�?�m�@�s?𖟠K�?�����?�7�ta�?�)L�"-�?���V/Ӭ@9X�"e�@��C/m@���Ǳ�@*�˯�@�����Q@Q导R�@p�B�v�@�>Dv��@<�r�6@�^�)�@�6�yw@ |E 7�@"*�T��@#��*��L@%�~��@'����@*,/��1@,�؍%*�@/��B��@0�	�XU�@2<�����@3�S�>�(@5K���T�@6���B+�@8��	"J|@:�,;*@<|3H�oc@>�DX��@@TPw�~@Ar��]�@B����3	@C�x�$�A@E t��1+@Fvނ���@G�Yor�@IP0KA�f@JӲj�<,@Lf֖x��@N	�+�	r@O�/2t�        ?�,����?�z���<?�)F|+P@"�7Hު@��`��@"z��U�@,����$@3ϻ:ߞ@:�mܤ�"@A-
��m�@E�2Jc_�@Jo���@O���&��@R�x�rd<@VG��@Y��Z��@]H���0@`�8��1@b�fM<̨@eN�I-C@gs�#�K@i��<��G@l��zra�@o}U� �|@q8�	��@r��6�q^@tbc�5H@vX�0�@wѸ��v�@y�z2�`q@{���:��@}{�C��@���d@��!�X0�@���F�Y�@��ֽ+G�@�#�63E@�R�U��@��K�n@���(T{�@�?��@�b�����@��kh�~X@�;��6�@��<���q@���{�3N@�� q�@�yEu��z@�>�G&7�@��X�9@��kJ̢s@����p�~@�����$@�`L��o@�B�iJ$@�*Y�Zjo@�X�>�\@�	�;$7b@���\į@��S���p@��\m?�@���X�@��f��        ?~IĵWb?��n�4 �?�<5���?����y?�����<?���ۀ?��P_�'@N"{�@
�D�q�@�A)��g@�{���@��]�@Ѯ����@!wD.��E@$6���@''(�|a\@*G�1/��@-�{��o.@0�`<��@2dH9I@4S0���G@6Yg돝Q@8v��W@:�^�iK�@<�ذ��@?U����w@@��A��@B-���'S@C�#5&1@D���-;�@FF���N�@G��@pAi@I:nFUF#@J�U���@L[���~�@M�yɋ��@O���陧@P�7���@Q�}�FJ�@R|�,�Z@Sk_X!�@T`��.@UZŏ���@V[n��@Wa����\@XnRd�9�@Y�\[~�@Z��J��@[�K�l^@\�-#�@@^ u���@_.Nk ��@`0��׉�@`�5�#@alUhy�o@b1"�@b���M>@cZ*�T�W@dR�ٷ@d�JE>S�@ea)��@f���b@f�Pa�yJ        ?>�;)�
8?u _ҕ?��<��?����n��?�����?���{#?В]��?׊���D�?��ٜ�R?��I�἞?�^��F1?�_Ɠ���?��n]�8?��<�?��]��H@ �<� e=@���a@�Fy���@
Eq���@�i���@#5�?c�@o1��;U@�U��ު@�P]�g�@��N��@��|@!8�����@#!�So@%0�����@'i�-7tX@)��d*�@,a���@/%x�l+@1�&��@2����n@4U V�6@6#����@8�p�G@:�*+_@<C��93�@>��y�@@|�[+�p@A�O]�(3@CD~���@D��TV{@F ��%5�@G�9j;^\@I0�ZLK@J冞�R�@L�>���_@N�@���@P>����@QA�a��F@RPF}�	�@Si�f��@T�T��^@U��;~{@@V��X�@XBr�t${@Y���c�@@Z���z}@\d��U�@]���t        ?TO�q�-?�NZ)��?��MD��?�C�T�I0?�ᰟ���?�����?����0?�J�{��{?��EwnV�?�t�Z�э?�<�:�?���'eL@ Â����@��xIn4@	1��X@5B:8͏@W��Yn@O��A�@�jS�@%9�ڻ@ �S�bZ@#g��lM@&2@��?@)@�Z$�@,�$7�@0�Ǔj @2��P�@4. �H�o@6tX�<�"@8�q�sd@;��[#7@>F�Ni�@@�R#�@B.S��v�@C���S@E�S0ѩ@Go����@Ia_M�@KlYC���@M�Q*�@O��,�J@Q� �f@RQcp�-�@S�Is�#�@T�+Fd@V[�s�&@Wӗ�F�@Y[<.y�Q@Z�H�t@\��V��@^U�!��@`� ���@`��5u�@a����Iz@b�"�@�@d�+�@emQVC@f1sX"F@gXJG�]@h����w@i�"���@k	�W~@lY}_�ew        ?�L���sJ@�ꖮ�@'��Wֽ�@;+��)F@H��v��@S�|�9�@\�Y�&�Z@c��W	Uj@i�;"xf�@pF˫���@t/ ] �@xV���
@|�o�@��K9�q�@���fr��@���6Q�@��Yl
�@��*yV�}@�$���@�����Hn@�ۇC*@��)�>Q�@����J9R@�"�����@�j��2��@�ˍF��@������@��äƉ�@�A�:�P@��Z�KHV@��$x�&@����'<(@���]�@����T@�V��`�@�	q4�3|@���6En@��E��@��Q�H@�����&2@����K&@���o>@��v��M�@�Ϩ<�>�@��b[�C�@����Mj@�6��A�@�g��Q\�@����n�@���l��@�*�g�
@�=m6�ծ@�鄊�V@��� 9��@�M�,�Oh@���EZ�@���_�@ā����@�FA��@��8=�@���(ޢ@Ǭ�/(ƿ@Ȃ��j�        ?c����p+?�)���L?�l��?�F����?���~o?�9�L+D?��~�߫�?���uN?������?���'s�?�T�׏@�0�@U.R�@����G@��W�f@y�-8o@��J���@o6&��@lld��@��`J�@~xz�@5jo�V>@ ����#@" �&��@#��g��@%$Ù&�%@&�O^\@(���$�@*P���Qc@,)�ZEل@.�~D��@0>"\]@1
�X��@2v�Ei@3,C'��@4I!R��@5n&�@6�5D�@7�%o};@9LSR	�@:R��\l @;��S���@<�D�'z@>R�A��w@?�7�!�F@@��)*�9@AM�,��@B/vQ��@B�˕�M<@C�^�a�a@D_�[�@E.���n@F:9(�!@F��0z�@G�/3\�u@H���/��@Ivu3/׹@J^��_�@KK�;�� @L=bΌZ�@M3���g�@N.�Ţ�@O.� bj        ?Ka�.�?FVs,q�?fA�̉�?{��W�z?�38(Be?��*8d�U?��* ,�?���}��"?���9�yW?�I��?�"�Ns�`?���P[;?�.://�?�M�t%�?����>/�?�$�[��?ྼTk#?�x�G�W?��R�S�J?�Ҕ��É?��c1���?�q��>?��N��=�?��5x��4@ ��أ�@t�4\�c@_�&c�U@	��-;8@/(Uq��@�e���@���R��@�l�E@��r��n@z�_���@��I?=@ kY%ʧ�@"4�p��@$"`æɹ@&5{�8��@(o����c@*Ӑ�A�f@-b���'@0�v��D@1���d��@3�Q��O@4��C��x@6v�7��_@8Qxl��;@:Hm:ll@<[2�-��@>��F���@@m��G�@A����b@B�5g�^$@DD3����@E�;�)��@G'��#�@H�+bBpd@JR���@L��XE@M�X��/@O�و8�@P�?)�        ?Q�S���#?��g�:q�?�(jp�?�����_?�q��%�?�-H0�[N?�ϵ���?��iz��f?�����?�^S�|��?��p�VuX?����X�@ D��S�@Yt^�@����@
`|�1�@Y*��+�@Q�9��@��dǀ@LJ��v@���Jo�@���@�*��@ �j���M@"��=N@$�q+t*�@&�,Bm��@(�3`���@*��f��@-+j��T@/����@1%j���G@2�����Q@4M���@5���D�@79�.�=@8�3���@:̿�&�@<��7G0@>ĉr�_@@t�>P�@A���e;@B�*qG�@C�'N�5@EG�_ h�@F��I���@H�M��@I�'p�@Kj�Fok@L�/���@NQϞ��p@P����@P�~�:�@Q�Ea��@R��q�@S�׻e�!@T�R넫@U�y��Q@W��AIe@X@��ב�@Yt,K��1@Z�F��ZQ@[�77��B        ?�DL��<?�������@m�%@%� %�.;@4V��,#@@{8[�ժ@HO׺��@P�<�(�@V �?9v�@\!a���@ad>N^@e	d"��"@h���)�@mDL���@p�U.��U@s]����@u��o.5@x���;�@{����@@~����?@��wВ��@���1��H@�`L<-�@�5�Ot+�@��+p�@�X
gaZ@�,
�dT(@�Pѿ���@�D���+|@�k�Ѯ�+@����^�@���A�n�@���u�@�m�;��I@��9R��@�-8��P�@�����5�@��
X�@�����@�)�w���@�a�D�Q@�3��<6�@�
���q@��f���@��U���@���.��@��(l��@�����P@��.��Z1@����n@��S}�1�@��Qc�!�@�����m@��=���?@��=�n΀@�ܪ?�5@����S�V@�����y@�)��҂�@���(��@�_J�Ʈ5@���Ҥ/�@���p��,        ?g.G��?�?�:�E�w�?�E��'�?�� �?�`��"?�q��*�?�%
>J�?��H2�*�?�,���~1@.7�}J@���r �@�W�6Aa@*�t�:@.�f!@r�(�n@�� av@�
`J�V@!_��E[�@#���P@%�*����@(,8{Ze@*�����@-W荄Ji@0xI",c@1�b\M�@3ӥ��@4�N۔@6C�C#��@7�&��s @9�o���@;�h���@=��� �@?�+���m@@�V���@A����9>@C#��>iQ@DVξ�ʷ@E�/��AV@F�1{�7@H:o�2�@I��f�Q&@Ke�ŕ@L��A,x�@N�Y6@O��)��@P�J@Q�WM�_@Rae'�n�@SE^���@T/0�>�@U�mr@V
5�"r@W�e�@XZ�gc�@YEv��@Z �����@[1T�0��@\G`/�.�@]b��L@^�F��J+@_�\�76@`j � �@a y�9�        ?Y��8K�"?������v?��0��� ?�A�u���?�|��[�?�5Hܱ�?��h�� "?�nB����?��vPl�@Q�oe�@.P��7�@�����@Ǖ��8@9�H�n@����@xc�1P�@ R]���@"����@$����~J@'�D@ju�@*T!}���@-Eb��T@03�{L@1�Ϯ	y$@3�^I.|q@5xH>E�B@7m��Ǯ@9|j�9�R@;��w"�@=�7t���@@(U9�@Aha&dCX@B�����E@Dw����@E��EO�@G	)KB��@H�	<@JD\-y@L �{-�@M��_�O@O��wIe{@Pۼ ���@Q�FkL�M@R�VʼUw@T$K��vu@UVw���@V�!�L��@W�q�]�@Y>��y2@Z�S7v��@\ <�#@]�Nbpy@_;B�@@`oI�2��@aHi�b��@b(�
��;@cJP^@d ���v@d��Kt_@e����V�@f��f��@h��@i ��V�P        ?N���;?��3�?���6t\�?���ۊ?��9�-?�5�]�?�,8I?��=�[�?�TJQ��?��\`�G?����:�?�?E�~�f?��*һ�@ )�!fW:@'i �@|7�D��@
-Y�!�@?�S��?@\����@�!�G��@x�0�g-@_��M@��~NS4@���j!@!�ČHix@#�ⳁF;@%�2Y �@(EK|�%<@*�	�5�@-s���͌@0+��^o@1��n�Al@3c���M�@5,�r�@7��	vI@9""��Z@;P�� H�@=��y%�@@A�8�@A^���@B���Xh�@D:9B�c�@Eǣ��GK@Gj�Y9�@I#�����@J�ְh8@L��tjLN@N��F;�*@Px�<�q@Q��Ҁg�@R��C��@S���)�@U' ՛��@Vs����@Wή?���@Y7~�?r�@Z��p��@\4!N��@]�Ti�2@_kZ�_�P@`���s��@aoK��8�@bW���7        ?��q���@��Ư2�@*d8dc;@?�����@M�#��@X����@a�Ӽ��@hh�Z�M�@p��<�@t^���@y+p��30@~q[��@�{aĈ�@�2a��`�@���0��@�K����@���?ڄ�@���5x�[@�)ƾ$�@�X��ll1@����j�@�*�Vx�@���Q��@�6rlq��@�����T@��J!��@���wz�@���^"�@��,;��@�l+�}@�*b�.�)@���aE@��`z�@�f¼�%@�îb�V@�v�7��@��i�C��@������@��4Ƭ�{@��v�)q@�Q���.@��J��I�@���tV��@�Xq�@�Ŕ2��@�=��-��@�`����~@�'�v���@����q�@��~c)M@Ü9\DB@�xQ@�X�>�^�@�>�$�@�)w!��@�
��)@�i!�;@��:�yz@�\KE�N@��/b�x@�����@��;S8@�*p|�        ?i��"ʸ?����U�w?��/�t��?���ݹ�?�,�_�aK?�Ҙ�ڰ?����^�?�ԭ-lx�@��p��@I<�X�	@!�]��@H���	�@̱��Z@�:� ^{@���20�@!
t5_v@#_,����@%חrfƝ@(sg:D�@+2\U�ud@.@�Pe�@0�r�H6@2 $�@3��눚�@5zЫTX�@7A����@9e��e%@:�F|��a@<��z�@>�MI?7�@@;��s�@A��4��4@B����V@C��F �@D�pnJ�4@E��<�9?@G�4�=�@H8Q�;?@Ie>4��@J����2�@K�x)�Da@MЦ���@NE��:�@O��p:@Phwqh|@Q�*f;@Q��91O�@Rat��>�@S.LU_}@S�5t�@TnD�5�/@U!��q@U�;����@V�k���@WI1]��}@X�����@X�E��5F@Y�=d�5@ZHz�K�@[�h��@[ս�n��@\����O4@]le�@R        ?hB��6S�?�� ȏ?�ƥ��$?���Pvn?�W˔�Ó?���5�?���N�	�@ �,�@k���y�@
�!UZ@I	���/@q�$f
@ڔScѼ@�}� Z>@mܴ��&@!M�Y��@#��Y�Ϲ@%�!q��!@(d/_���@+#(���@-�{����@0htm:\@1��&:@3�F��r@5`hU�@78��7H@9)vj��?@;5��Q-@=_��x�@?��4�DQ@A ���@BK�{�C@C��yW�h@Ec!�>@F�.�@H]/uQ;@I�����@K}�5	��@MQ-IX�-@O<|S��?@P�*K�@Q����@R�W���@S�P>�F@U)�7;�@Vn�ݾ�@W��/ȁ@Y#?bP�@Z����ޭ@\�=r��@]��7���@_?���2
@`v���t@aUY���@b</9�@c+9�hؠ@d"�&�`�@e"�� b@f+Z��@g<v�A�@hV��fɧ@iz���T�@j���w=�        ?a�/T�ċ?����y8?����|��?�mZ:x�?�o֯2?��1����?��uM��?�V����?�"A>[H�?��xܻ�?�&����@ l��W~�@������@(�,�@�5<6@5�=�@����F@Y_�h@�m�K@�Y���@�R���@ )�>��@!�; DFu@#�f���@%�@($���@*��r}05@-�� 6 @/�1A�c.@1{�g�C�@3)��k�\@4�����@7 :�\��@9,�)%��@;���M@><i8×@@d���ʢ@A�O��@Ci Sc{�@E�B��!@F�.UB�@H��I%�@J��r�@L�eDr-@N�=KC_@P�,)nE�@Q���@S'����@T�0��;@U��R@Wj��n�@X��#޻@Z���f�@\Y��	H^@^(�[́@`���3#@a�h��@b�^�@c�CXa@d=t��9�@eg��όu@f�&��D�@g�KqP        ?ޒ��V�@�\��@2׏SD��@F�&�F�v@Uh��$�<@a<#��R@i#�4�+@q)��v)@v^5;��@|)��)9y@�D�j�@��!i���@�u+9�i@�s[�|�@�Y��>{O@��{s�K&@��ܟ{^�@�w%�g��@���w�I@�Π��$@�����@�NKr�<@��w˭Y@�n�_�i@�5X�m@����q{@����@�RJ��#@�(gO��@�̵*m�@�w���6�@�o2���N@�i��]�2@�g�4wn�@�hXrt�f@�k���%@�q,�?�@�y9�ͅ�@���?_)'@��PN�[@��I	��O@�����d'@���Е�@�ّ���@��Q7��@��j^��@��|%�!-@�"l��^@��e���@�Cg;K�@��m�e�@�hq�&�9@��k8��@đP��B@�'~V'@Žɮv��@�UV,Y�D@���J"�7@Ǉ>���@�!&��.�@ȼ ��6@�W����N@���.0��        ?XOP2@?��=�+�[?�:E�U�n?��L�Ϻ?˜�Y(b�?�B��V�?�XVs�?恃����?픀��l?��Z�3m ?�3�JM�?���.�@ ���@��-R��@���LY�@	��z�l�@�/��J~@���}@�8n(TE@��i �@�5n��Y@8��.:@�JN-C@ ����@ ^�r�@!���`k@#"bdV�L@$�,qO%@&.�m-@'�gF2@V@)H�0{d�@*�b\<�@,�һ@.o����@0 ����Q@1��G@2��|2*@3h���@4��[V@5��.@6���Z@7/���B@8J���@9l��5]@:���	@;�,@�-�@<�_��_@>4TK��@?w"v��@@`m��)�@A�<k��@A��r���@Bc�|q�@C�#~��@C�3��z�@D�%�5��@ED�w���@F�4��@Fʀmu��@G��@9�X@H^�͛ @I.gI�>�@J�,���        ?"�/.a?U_��"�?u��C�[?�B/��;�?�n��9c?��P�ӽ?�^����.?��F���?��c�D
?�>dt��?���z��?�OO�SHq?ݦ:s�\?�>"]�?� ���?�*Z,��?�Hu_?�l�9?�v��%�>?����@��@|U�P�@����@QX�;�@
�00�p@��*%	@sl�LJ�@��f��@|x�̜@^-��%}@����^@���qj�@!Ё,��@#��9�@%��c�@(M ���@*�)w��@-y#Y��n@0*���Q@1�9֧@3S`��,n@5t�J��@6煮>eJ@8ܫb���@:���@="��3�i@?u��m�@@�u��B�@BAm��!I@C���5L�@E^�j8F@F����LD@H-Y66@I�,���j@K��.\x�@Mu��ꁡ@Oe1:A�)@P�#8k#�@QŽ��C@R�\��@T
l�cm�@U@'yC7�@V�A=��@W�=��&        ?I��R�4�?z��ٯl?�DJl��?����H9?���	r�?Ɨ&F6ߠ?���Ph�O?��|J�\?�dn��?�nj�o?�Ǥq�t�?��v��?�}�@��?�ĉ}�Z�?���(�'�@v-�1
V@m2�B��@�57�ą@E&�do@+x\�o@���ކe@��!�@ng�H�@����&@۫-B�@֊�S(�@ ��i��>@"�#�[�@$pY@{~@&L�/J5�@(B�����@*Q�7%��@,{g�<��@.�E�9�=@0��c��c@1�'�P�@3����@4}�ĥ�@5��W@7mL.�Ԛ@8��:J�@:��Қ��@<V��@>6�Y�@?��H]�o@@�OR��@A�N�Z�P@B�2;�cd@D2���@E.��x�R@FWo�@G�����@H���&o�@Jņ�3�@Ki+�F<9@L�:Q�7@N7#P�i-@O�����@P��1*�h@Qco��;@@R2��`�@S&>#@S�+�xg4        ?��ď��p?�������@	֫��,@��A� 2@,���Dt}@7/�g��I@@�����&@GJ��0�@Npf<ԥ�@S1��~�9@W�}��9P@\L��R��@`�Ă�m�@cuLn�6�@fdᥲm @i�m�jjn@l�ȗ��@p)[��Wc@r }7�n�@s�)|ҝ�@u�IXwƬ@x�[X�H@zGȼ�}@|�8��-�@~�0,���@���(�]@�k2�T>@�X���S&@��55ܰ@�'ɟ�@��9���@�%�n�B@����d��@�Rq�Bm@���j��@��ĿoiX@��#da�@���>S�?@����A@�x�	��@�og^GJ@�k��5]6@�n�`Ii1@�wDx+us@��V��iX@�����[@��NtY-P@�ۜ�"f@�9R@H@�7�2�Z�@�p�)%��@�Xt/�lS@��Brq��@���d�}@�NۥI��@������@��6�S(@�f9~܎�@� w �6@�݄G���@����֛B@�c�q�� @�,5���        ?I2Xw8
?+%��;?�����Y;?�uEG��?����̈�?́C͕>?�4nMV?�<���N?���`F�?�dq[�`?��I��g?�˔��d?�	Oq�x�?���t��a@^=�@I�Wڱ@��V2@
4XT��F@���Q�A@�6[f��@|�c#�-@�f���#@���N.�@��� ��@8w���@���Ee(@ #�$=(@!}��3s@"��{�a�@$a�uP��@%�V�VA0@'�(�+s�@)/T���;@*��,�@,���B_@.���S��@0?���/{@1>�<Z�@2F�+��@3WI��a.@4plwG��@5�:�}v�@6���O@7��Da�@9+�1���@:pv*�e@;�ț��0@=Ϡ���@>r���n@?��n��@@�9���,@Aa�)��@B"��'��@B�i@@C�BZ�]@D���8@EU�i��j@F.�.AP�@Gny,Ɨ@G�VՕn@H�q�Du@I��ql|�@J��th��        ?'E6SI�N?aY����1?������~?����e?�*�U�?�쾡~�?�Gj��?�g�q�?������?���N�>?�}�0D�s?�9c~���?�:}
�?�jP1��?�{>�XLu?��g_��"?�wU��@ ���b��@�g�U�@�:���@�5�s��@���~�@��uR�@Iq�S�@Y2�{T@���j�@p[j�@!���� �@#��3@z@&c�9#a@@)��b��@+�W��#q@.���YI@1��'%@2�P-f�@4��8�Q@6բ�=�@9��d��@;T�N��L@=��k�װ@@6:�a�S@A�j�ԙ�@C����@D��*���@FH/�D@H�sq�@I����r@K�蘢��@M��dcU@O�O���@Q��Kb@R=��l @Sv���@T���HG�@V'��9@Wvcr���@X�����@Zm-���5@\ �@��@]�o�֗�@_YF�!4�@`��n?�;@a{�x=d        ?1���(S?b���S?��)���3?�i*v�V7?�y\��?�?�����3?����k�?�#�!�]H?ȝ;�	E?�+$�>̒?Ժx��u:?��k���?�%��Mm�?��3���?���R��?�}8J�?�K�p�?�K�.s?������?�toj�?��
��]	@R!c�[@u��u�@�=����@>U��@ն����@b7�u�|@�Έ��@�8s~'@h1�.@'�����@ �|M�9@ �C��@"c)��o@$<B���@&6��`�@(S�^E:]@*��"f@,����Ê@/����/�@1�:�87@2��굂;@4b�l�q@5��Zod�@7S끘��@9�m��@:�{t0�@<��Z pJ@>�
���@@����@A�כ7:@B�I3��@D^;�#@E`l0�@F����{H@Hũ���@I��B�)�@K�f�]5@L��y~��@NN֪N��@P�V�w2@P�pe��@Q�*�SL        ?���y�4?�:�Z��@�W�CI�@�)��b
@&�Z!p��@3+9�[	@<��P��@DZ����@KD���H�@Q��R4��@V�7��@[�kMВ@`Axe��@c?�[7.�@fr!%��@jD.Qr@mŰ�WKe@p�	E@sZ�+6h@uT=ğ��@w��Ffeg@zK��a	�@|��Q��@��w���@�c�WhL@���6/�@��O(�/�@�Eugno�@��Ⳑr@��԰�Ax@�њ.wɗ@��$���h@��K��8@��{��@�&�W�	S@�O�3I��@��w�o\�@�����@�
�O	��@�^cd}4@��$�A҃@�$О��@���:��!@����@�����C@����z��@�f����@�90��)P@�]r�<%@���ִ�@���Ε��@��;Hs?@�����B@��1���@��0�r�[@���|��J@���9 �@��j�E8@��<.��@������@�ε%��@������@���s��t        ?Z�\���?�X��z�?�F�'��?���X���?Ӧٱ��?����H?��>�i?��wقB?��0r�%�?�44w{@�/d�!;@{w+�@	��Śww@c:2O1�@�kr��0@g����;@L���@dI�G�#@�}%�+X@ �>��@"t�
�@$lA*Rkw@&�p�i��@(�	k�L@+cZ-8@-r��M�@/�)�d��@1T���@2�Ke�(�@4,�&Y�@5�����o@7A[�̷�@8�i���@:��L8�9@<R:b��@>!1՟@?�]���@@�6wkm\@A���e@B�o~�@D�c�M�@E2}t��@F:��
@G^�A B@H��Ҋ�@I�&R�v@J�BZ`�B@L?pKO�K@M��^�� @N�S-*@P��~�K@P��ɘ�@Q�|���@REt�H@S���v�@S�/���d@T�2��@Uc�Tf��@V73��D�@WxKR t@W�03�=@X�Z���@Y��d�        ?JI���8?���8m?��>q��?���Q??Śz�v�t?��q�)d�?ڗR��p�?⢔	�d�?��mt7'?��Y͉S?�H�N"gz?�S�co�?�XX��K�@*#K��@����f@	9<���@V�x�@��չ�@p�HJX@.�|��@/ ��;(@u���@ ��T9@!���@$����.@&JJ_��Q@(�}�3��@+RP�39�@.�KC@0��aD@2#����=@3���@5��ٸB@7�]�h��@9��;)�@;�]�@9@>��+Ã@@<����@A��N� @Bߟ�4=@DM\��c�@E�����@Gd�oȃu@I%�N1@J�U�r2p@L�����@N���!�\@PK�F�@QZO9�t�@Ru�hLr@S�t�A�@TУ� e@V�,To,@W`-�`��@X��֐g�@Z$��U^�@[��)�ݩ@]߭O�a@^�m��@`%�g���@`��y�I�@a�1���f@b���"�        ?_�)��?6���N?X��z�?p�����?�6)D
?��F�(3?�g��?�W	�oԱ?����w�Z?�+u����?���c`�?�4��9�?�#@'���?ԅ�`"�z?ڟn�rLW?�JJ���?�vָA��?꾨:��?�y��a?�bǫ=�?�D Ā�?��4��@>��<1
@Q|g�.�@�6L�XK@�U�q��@�}�ϸ@S���+�@���C@���V@@򲉸*N@_��C�f@!�T3�@#]�@��@%D�$q�@'�ށЪ@*3�q,'�@,������@/�=���,@1�����@3D���+@5�4+WP@7����3@9$}_��@;^��;*@=�?�@@ �R�$i@AvW�Ɖ@B�^�i�@D^�'��P@E�� j;@G�v9�N�@I[r;�@K1[Ma\@M�7��@O$��EZ@P���L�b@Q����7@R�E/z6�@T�jϓ�@UYQ�c@V��ʆ�@X"�X.        ?�Ɍ��pR?�:~�r��@����V@(�пvӤ@7w�?C2�@C$��9�X@Lm%M���@S�,���c@ZK]�E|�@`��i;!6@e��B�@i����
�@n��Y�@rA@��@uK��'S@x���@�s@|f��h@����}@��%�a8�@�y^pA@�_&�|S@��F3�@�^�>�i�@�[B`@�{I���@��c�2|@����@�?x��3�@���q��@�π�Q�@��IL}<@���.4]K@����l-@�o0�K�@������@����O�z@�������@��FBx@�Y���v@������@�����@@�^�hT,@�� ��oD@�?
٭,�@����a@�#�-�"�@��O�Y@��>�a@��&K��V@�i��=@�HY'���@�,�>���@��H��|@����	�@��[��@���Cդ@���䒨�@�R袒�@�����@�"���V@�<��ĝ@�\��~@�Ax,�        ?Qm�ﰢ?��ݺ�?��poT�?���-EV�?�̺�*�?Ұւ��(?��Y�g/?�h3۬?��<7�s?����v[�?������?�'���<?� ��ï�@�]T��@��g@ٗJ�$z@8� =M�@в��I�@P�(3�$@U�=N@u�6�@�)Ń��@
�D���@~���u@��j�@ ��F�@"@^��d�@#����@%.����q@&���mg�@(Q{�)� @)��/DqR@+��̧8@-dƿ�Nl@/.�|��@0��6"-�@1tX"��@2l+��	@3j�48@4nY��@5xϲ��1@6�yQ5{@@7�L��|�@8�>2�B�@9�B�C��@;	TjH �@<8qY��U@=m��Bo�@>���Oâ@?�@��@@��]��[@A?��77�@A��8P�@B�(hS��@CG�lSJ�@C�f)h��@D����_^@El��^o@F*��è@F�<e��@G����	@Hx�Y�:c@IC��m��        ?,?+�BD�?\���S�?y7��4��?���q��?�N0�:s7?�T��[?��B'��?���G�?���:C?�|O�7�?�$���?�`3/2��?�����3�?�N�֣��?�H�vxg?��}�Y�E?�!����?��chS�w?���OR�1?��5K2��?��1.�?��U����@ �5L���@"��G@���M3`@	(�'�<@��+Y�u@GAb��@j.�t�@�d	��i@S%xQdT@ĲRM@+�V��@ =��BW@"V���@#�`�8B@&��C̢@(I�+
��@*�RC�,@-D�(ӵ@0���@1{L6��A@3c:�5@4�:���b@6|�a���@8^B�Q�@:\��R�@<x��,��@>��ǽn@@�zG���@AŜAƲ<@C�>�@Du���q�@E��Q	�@Gn�M��@I۞e@J��(sy@Lv����M@NMTm�@P�JU��@Q6��@R*�X`��@SC�Np�        ?AWYG*Sv?s�&xc�?�3z��?�1����	?�Ǣ���?��PY:?Ό�����?չ����?�k�` ,R?�6Ɯܒ?�k�TǤ�?�c�����?�,�}`?�s9���?�Ε�9FJ?���O��@��@� o@�����@	$�r�^u@��6')@��\��O@�r�y@�P�6Jq@z��7�@�����@%�{RP@!|�@4�e@#��+�X�@%��c�@([-�0��@+�h�"@-�c����@0���O$�@2L�\Ү@4&
\�@6#�y@8H.�Q�@:��l7|�@=��I�H@?�w�U?@A@x�9�3@B���|-@D\R���	@FbnN�@@G���^(@I�E�Q�@K�]7�x@Nm}%�@P'R)/?j@Q]��@R�$JTj@S�
��@Uh`��x�@V澹]>�@Xx���0@Z�#�4q@[�!Q@]��M�A@_��S�O@`ǥ�&�C@a�;��	@b��ʣ*v@d�L��        ?�����`?�yTUn�@�����@���^@)7^�a,�@4�Wq�nO@>���gX�@Ea�Ur�%@LY��:=d@R!�(��j@V�9v��(@[r �Ɛ�@`f>�K�@cN���@frQ���r@i����@mj�)[��@p��#��@r�Dz�}@t�0H�@w��.SG@ysl���@{����@~��\@���f��@�͡�{�@���Y���@��?���@����:Ǉ@�SuFD�@��o9g"@���/��B@�����@�s�ݫӿ@���>��@������@����с�@������@��{���~@�޻�[��@������@�!롕#@�M�>���@���g�@��s���
@������@�B�U�}@��;��<u@�sg�G�'@�!��u�@�Ӣ��L�@��$�;�6@�BG�(?E@��lk�@����J��@���j#f@�K�Dq@�oZ�@���@���s�`@���b]F�@�m =�@�L�N�        ?_����O"?���0��?��-�-[�?�8&��?օ��?�?�/N��\?�����e]?��o�$?��߮�� ?�Zd����@���y>@�7#풳@k��K7@��g��@�����@z�w�X@����@����@ Z'Hl�@"HH=��@$T�8�a@&y���v@(��f;�@+1k�$>@-�n��`l@0/:�)@1�
;�Q�@3V&��@4�����2@6��@7�A����@9a	Px�@;G��2�@<�qՖq@>�g���@@[��4��@AZ#F|~G@B`}��%�@Cn�F5E�@D�>��4v@E���D@F�o��.H@G�Pe�'@I0j��GG@Jo�! '@K�Jj�E@M73�G@N^�4.�@O���u@P�`��Z@QKQ���@R5by@R�j0�"@S���^�[@TRYM��@U�W�@U�E�g0@V���x��@W���QsM@Xs�,��@YR,�9�P@Z5P>�ɟ@[u��7�        ?KT�/�_?��)�Ե?����4A?�����#�?��ݔ�#?ԷR��?�F���w�?��|�:?���R�{?�v{��T?��\6�?��a�5��@�t�tL�@���e]@4}1��@娆EP@�ѣ=O(@��,"��@g����@3�~w(@ ����"@"��W�/�@%�ʠ�xp@(D�7X@+E�P-�@.�� ��@1	�A�%�@2�?����@5%��X�@7>:�*�?@9���w�@<.��Q�@>�3pJHl@@辀�g@Bt�wG�@D�����@E��#6m-@G���@I��I��8@K�O@>r�@M��N��A@P��m@Q=�ɠ�@R}��u�@S̵x>)<@U+Cr!�C@V����l�@X�/��@Y�8��@[E"ą�m@\��}��@^�D���@`Cw�Â@a4����|@b/St��@c2���A�@d>��{q2@eT�S�J$@fsn?E�?@g���J�@h���%@j
)��6o@kP^��u        ?,(t���?`��C#?ƭ�,	�?�p�Fɀ�?��t���m?�@�nW��?�Ծ�C>!?�|U_
�?ǃ�L�?�X�*�<?�g,d��??����8�?�i�P��?�gF��S�?�Kt���?��5m?�z�5�e?�)��N�[?�h�IҐ�?�E�$���@h�]�;�@��ys0[@	3(x^�@\���Y@�4e��@5*�� @�����@���8�@*;�l��@�G��#9@!ˏ�GH�@#�lz�#�@&%�Ԅ��@(���:��@+/k<�I@-���A�W@0x�Q���@2�aMط@3�Ű��@5�uiϔ@7dRF3�@9`-P�@;v�+:}&@=���e�@?���j�@A0�|l5@Bt����@C����@E'��_�@F�.T�@HI��x@I��V(��@KC����@L��n<@N��%�@P<�����@Q*�4 �@R ��k�@SKC��~@T#άAǡ@U1F�+@VF�d�4m@Wd\�o)n        ?��M�`h?�L����H@0�uN�@-q�^H�@;o�6�Y@FU_�0��@P����D@V�,SB�@^st3G��@c}�GS߸@hID���R@m��WB�F@q���W@t��ZN*@xw[>i�@|A�DZ@�+=u� @�\餈N�@�����q�@�;3�\D@��-$�8@���V�FQ@���ԗɑ@���d��@�7��n��@�/}H�d@���Ks�@��r�Ho@��	�Q�@��\��@�I�����@�΄�Cw@�tl5�"@�C�;Y�@��]����@��S� u@�H�͎@��6���@�/�P��@��8cY�@�B�J-�'@����ٳ@�AB�1�@�}h٥g@��!j4��@����%@��ag��@��و/@��tX��@�� �G��@������L@��qq?�8@������@��hHп4@���1s�@����o��@�齈�X�@�����+@�g�c�@��]�	-@�A��'@��V���A@�v�P"�        ?8�W�m9?l��m��?��Gż�
?�5?*AL�?������?���=�Y?�mϽu?ϗ���t�?�.��(�?�`��Ɠ?�3;�܎�?�#�^�z�?�S�k��?�[Xԩ?��L��)�?������H?�ܔ��FR?�A�k�O"?���@k;%�o�@���a"@���4�.@#�i\�V@
��7�7@U�iɩ�@�J�h�@�QB�B�@ �TI�@�/fx�@���v��@Q�%eB�@9�1)l @9��	�!@R5.���@ B	'���@!h�u�@"�v-�+5@#ܣ�}E�@%+қݪ@&�0�E��@'��su�/@)n�|藓@*��p�M�@,����f@.5��B@/���@0���SP�@1�I~3TN@2�=Z�@3��0�@4��(�[�@5��/9@6�
Mg�+@7����@8�נ�@:5��a@;K(<���@<��7x��@=��=f�@?˛.t@@'�n��@@��Km-�@A~��p�        ?��G=,�?G%`A���?iL�jS �?� �6�#�?��=&(?���7��?�v�s6S�?�A��$?�:�w�s?¾��:#�?�f�̀g?�t�`%�?�+���?��z���?��՝�$?���z�|?�;�u���?�LW4tk?�D��?��?��J�}�?�����?��5�M�'@n&�g8�@'ϫ2�p@,�]*@
��P݁�@*ƍ���@�Gm@Dfi]�(@���U@3^��<@��.,��@��I��@ ����~�@"F�,H�@$��O��@&
�Y��@(P��X�@*KӃ�t@,�X��� @/����@0ӛ���@20�e��@3�^�!��@5"�<@6���ͺ�@8b��i@:!O����@;��2_�p@=݃��@?�WBu�@@��>��1@B�Tm@C1�r�@D_FT@;�@E�޻��
@F�6��@H5�7H@I�w�|0@KZM�$@L��Z]��@N���e@O��6'        ?G����]?}I2�p��?�T֑��~?�o�;�?��1��>?�a�)�>k?�R|>��?��-am�?�y�3i��?�~Rج��?�����a<@ �
h��@�QTf@	����(@���҈@""{�L�@=Z���@������@W�8) @ -� �@"Y��%@$���*@'-�3�Ė@)�}���/@,������@/�п[z#@1vy��T@3)4P4y@4���֓@6�����%@8٨}��@:�����@=-�]R3@?������@@�@�@BI/6_˿@C�+�t�@E���@F�^�f�@H5����@I�i�=�9@K�?_�R@M�T#9@O�{���@P�j:@~@Q��F�4y@Sc��� @T=,t�i@U�Ё�@Vئ�u��@X>�݂�@Y���)C�@[=:	O�@\խ"Q�@^Au��@`��7�@aMs���@a�_ �@b�_�_΅@c�c��­@d�{�2�@f��U�J@g%��        ?�{��t�?ڥ���?��Nz|;@�͇h��@TG�˒�@(�P�ZV@23�y���@9C��@@�\Y�l�@D��P�Q�@I�U�T�@O}�b�'@R�M�G�@V�0Rq�@Y��h�-�@]�&�N�@`�IB�@c&h5�@e�����@h$�I�ِ@j��N���@m���ow~@psa�H�@r�u�@s��i�w@u�j��q�@w��߮^@y��E�m@{����L�@}�K6��K@���ȳ�@�NH0��@����}��@�� f��@�L�w-@��J��@�E)�&�W@��'�@���>17@�;�U���@�b�/{�@�r�G�:@�j����@�l��\�@�w�.6@��n9Ěc@��Ms�$�@�Т%ܖ�@�f�4a@�;�NH�M@�+e�8�@��"Z�'@�"x�:�~@��*�U�<@��1Zd�@����v��@�l�� O@�.�\�=y@����Xz@���wo�@���)�@�e�M��@�>�����        ?x���M�?�����r}?ˊ�9�O�?�R��X�?Üs�?��׳��@G���M�@	VqE�~@�����V@|��^��@�;	��@ os��h@#����@?@'����a:@+��J�O�@061�@2h�{�B@4��u!t@7��0h@:��	E�@=�G{�@@o.~�*@B��V_�@Cߥ�c�l@E���z�@G�$�$V5@I�F����@K����Z`@M���<vP@O���ot�@Q�����@RAHd��@Sq�)W`R@T�n�T@Uꚅ"v�@W2��@X���: @Y��kP}#@[4��E@\�`��@^%�Y@_w�XC�@`xϙ	��@a9�u@a��'uK�@b��v�S@c��Ɂ�@db�vҨ	@e5���jS@f�l� @f��<1C@g�9o4w@h�a+��c@i�J����@jf����&@kM�%3��@l7d]@m#4Nl�M@nDZ��@o��4��@o��l+w�@pt0�[�|@p�s�I�S        ?�(�+Q��?��"F?׿h���?�5Ō�`�?��aW�t@,�Wu�@d�m�A�@dIN���@�Z2t"J@X`�&I@!��^~�|@%���`@(�X��!�@,:8s��K@0	m���@2
eV�L�@4�B��z@6F8 a�a@8l�6<}@:��K�@=%H� �@?�O&�@A�]م�@BLU@�@C�|a��@D�}K��m@FN�t�Й@G����o@I#cRG�@J�j_��@L��8t@M��B���@O4p�-�@Pg�
Eg�@Q:K�6�@RԘ��@R�pu�8@S��q@�@T���uI�@U�P�@V�T`��@W�xL[@X��Qj�@Y�.5��6@Z���<u@[�R��c@\�F`;C@^�Xh(�@_5�-@`6�k67�@`��WΆi@a~b�)�@b)nަ�j@b�H)|�.@c��I���@dM!�03@e~��-@e�
#�<�@f��&�9�@g|I~��@hXD4O!@i:���p�@j$����        ?����?����h&?�O�m�A�?�Xl/��9?��ŕԧ�?��`��@`c����@
/�?�b@쟡��@77�jZ�@�dM�`@g�l��w@"��7S4;@%����V@)�a>�M@-c�|MC(@0���n+>@2�C���@5P���*@7���E3@:a���@=J����@?��"�@Au����@Cۏ��@D�[4���@FK/7+&�@H��@I�z��L�@K�\�+@M�d���6@O��#��t@P����@Q�����.@S�8�9@T1I��Li@U`�%�u�@V�l�u�
@W���M�@Y.����@Z��H�Q.@[�ˮ���@]f�92e@^�@.j�@`<V#��@a[pN4@a��f'@b��c1m@c�J�(:@d���]�@e��sY@f���~JP@g��z@�@h�����@i��8�6@j��"\�O@k�t��@m��RB�@nH����@o���9��@pg�ܲ��@q��#Zk@q�?e��:        ?��W��@%�~(���@C�.h�u�@V����N%@e!.���@p��L�ߤ@xjh�8F^@���v*�@��+_�A�@�Hy�ɘ�@��nR)v@�B'ɿtc@�9�^�@�7R�@�W_��C�@��%Ǻw�@�ES3�6�@��-|x�@����m@���ʓ�+@�ew�g<�@����f!�@�����vp@�Y�,A�2@�2|1�G@��.IaΘ@���)z@���3�X@��.4�=j@�T�?�@�[�	�@�f�i��@�w����@č�j�,�@Ũ}��t/@������f@�����_ @��pZ�@�@�߄ߞ@�q�Y��@̦��4�@������{@���爋@�0��j�@��+�oX@�yǙj|�@�!kr9Ȁ@����m|�@�v_R��@�#w2���@��(Y8�~@ՂXZQ/@�3�b�X@���QѾ$@ך���@�P6���@��K�x@ٽ�[�o@�v0�}�@�/Uh��@��CE��@ܣ�rx
�@�_53�`�        ?u]m��4�?�Z�4֖�?ǔ�~q�?�ݐ ڶ?��n��h?�	p�5?�m��Ni@nC�@	j�d���@+��c�@��3���@��=\e@cE����@ � #I�@#/�<gp@%����|@(���j��@+�l{�r@/3{��$�@1Os�@3�ή�@4��	
�	@6����@8� L@;x.�=2@=<�m�d@?��7�b@@�h�x(n@B n-��"@C^��t��@D��Z�+	@E��e)@GRk�(�w@H���mO`@J!�zOr�@K��ߎ��@MkA��@N��E���@P�ԛ~b@P���T��@Q�d	,�@R���E��@SZ�!,�@T5�\��@U�Q�P�@U�j�[�@V��p�yP@W�0.t@X��j�$�@Y�(���@Z��%v�@[��
D/�@\�6wW��@]}�j��@^{�
���@_}��@`@f;���@`ä���"@aH<�I��@a�.�50k@bU~[���@b�/H���@chE��&O        ?y Y��*?�ۗ� ��?�-�Hj?�t��@�g?��'�6��?��~f�W?��n߅%�@� ����@
F�Խ-@K�zYJ@�"{M�G@aωGi�@IW�yG@kљ�Z�@!��6��@$.w\^��@&�MAC@)��F�s@+��$�@.vJ�q=@0�����@2&\-�@3��<qW�@5Q�l��l@7 ����@8��A��@:��-��=@<|!F�g)@>vw�O�@@B�	h\@ATt��c�@Bq)!�E@C�
>���@D�o�c�@F��LM@GW-tE��@H�7�˼�@J(����@K�S)a�@M��a@N����,n@P���~@P� Zb<@Qȿ��<@R�Z��@S�u]W^�@T�-'��p@U��})K$@V�����@W�b��-@X�.7`@Y�
��@Z�R��@\A��/P@]D��J'@^�S�$�@_�ԏ)7�@`���@�=@a>Z�\D@a�1t19�@b�y�9�@cjVX�5@d.횿�        ?d)�a,�?�&��@��?��ꉵ?�90��\�?�J1��s?����l"?�?lJ�?��r͎��?��V�Qt�?��*d?@{�&�M+@ew�)�@
��g��@\��A@7�`���@�C&s�3@��b���@੨��@�=BmF�@!i8�eN@#�rOa@%(6�y��@'f�q��@)�X]`�g@,V���H�@/ұ�`a@0�8@�@2~�~*@4y:��@5�{��@@7�`	֨?@9�O�w��@;��!'R�@=�]�o&�@?�o���@A;�0�@BMo�P��@C���PU@D��O��@FDN�l)�@G�d��$�@I1?�d0@J�*�@LZD�]$@N��,M�@O�|���	@PƏp�`�@Q����v�@R��XD�(@S���\z@T�Q���%@U���Y�?@V�����@W�i�r��@Y)7鉟�@Z^�rf��@[��4���@\�1?��@^9�D�^@_���/�&@`�p��@a9� ��'@a���4x        ?�,q��.�@"�=@@E�!��@RKHBϫZ@`~�pe@i��Ey@r��_EA@yK�{/�j@�j~y#�n@����&x@�;�%��i@�@�]75�@��겥�Z@���W=�@��-���@�,Z&�G@�~ǵ-�@�v��_�@���$|#@���Rq@���콱d@�����@�E(���@��.�~��@��J6<]�@�)�>dOf@�i&wq;�@���%��@��-̂@�]��`@�����@�*9y�#$@�������@����_@����	��@�#�Ͼ!*@�Z�����@�&� �@����2�@��"-O@àđ��@�z�"2�@�WɌ��d@�7�g���@��,�@�$ؤ��@�����@��yO�p(@�Ô9n@˴0<R�@̧7\��<@͜�fH�r@Δ8CoYZ@ώ��z-@�ED��@��,s�I@�D)��2�@��B�o��@�GZ�C@@��n���'@�N|c�ua@�ӄP���@�Y�o        ?(ϩ�@?`@lv��T?�떯�Ra?�+��͵?�`��rlT?�<}��/T?���@\S?�g���1?�4A�<x?�('��(�?�bFc��J?�NR�O_?�y ���?�*�L�C�?�Ay�9�?��p�ύ�?����a�n?����ɼ?�u���@?����{X�?�
ɓ%f"@ ڡr���@�z	.@�%�7�}@���4@	v�9=�@�_�ZM�@���@����*�@���
@�����@�o@����@S��E@
���@��~b�@��v���@��i��@ �%XD�@!��7�H@"�VE�n�@#ב���v@$��ڱ�K@&[�ė�@'9M�ڒ@(j�'c��@)�����@*�ՊU�)@,3��d@-��r�@.�i�ʖ�@0%��G�@0݇ʍ_#@1��=K<I@2ZEݐ�/@3Uz�2@3�Юzx�@4���Ǳ�@5�� �O�@6_Oei�@7:�-�H@8��@8�(e�(�        ?0^��?K?>�o�X?a/~��۫?w�8з�6?� �S�;�?��d#3�?�]r�ч�?��9���?�,�����?�t��i�?�	��d�F?�3����?�]��}��?��΀�An?�\�1(_z?�h���:v?�3�ZN�?螐^H�?����yk?��܌X�?�!d(5�?���	�x?�*?���@ ����.�@����@�m�{�=@	́�6^�@\ ��H�@��Ϝ�w@���W��@����p@��/��&@<�.c{�@!�W��z@ s���&@!��E
�@#�ޅi��@%s�rqC@'w�2�ۜ@)��.�@+�|���@.K�& g@0lJ1b�7@1�`�4y@31��h�F@4��8��@6F%��Z@7�J%t�@9��ʣ�@;�g��K�@=m]����@?oJ�UU@@�YhP`(@A��!�z@C ���@D3t�Tޔ@Eq�w�n�@F��{��t@H^���@I{X`>�@J�Գ�k@Lp�[$@N ���|�        ?$���@V�?Xhd_��j?yQ%=U��?�ލ�<�Q?�\̙�@�?�i�mo �?���T:�?��j-��?�I��	~?�5��-1?�����?ڧi����?��ά�D?�fQ�IY?��*٫u?���k���?������?�H_ZLr?��oay?��㄃�@ �[/7�@Tg�x�@2!���@	[_����@��;���@O�@�@`ȶ`P�@�Q���@S3���@��a��o@{�����@����d�@!_X(��@#�)�_@$��Yv!�@&�R��P@)q��@+@�؞Y@-��0��^@0��/��@1go��ck@2�b �L@4P�{��c@5���W�u@7�g�|��@9V�W)�	@;4"��"0@=+=81i�@?=	-R�@@�4�/��@A�.uA@C�9閷@DP[n%2x@E��Ά�	@G�}���@Hw*>�'@I�f>U'@K��&��^@M5�<��@N�g-��@P\$0�!�@QK�}�Z@RC�wd        ?��Kͥc?��"��2�?�z���?��9� �@T�U��@%�Cp�@$B[m:��@-'7�k@3�etS@:a�K�A@@����@D�
�eƊ@I�k@M�_߳@Q��h>`@T�k�#�@W�⋳��@[}*IGm�@_S���@�@a�y[V�@c�F?�@fT��?�~@h�z
6�S@k��Ҽϻ@nbs���@p���5�@rAQ���@s�f�B;M@u�����J@wc�B��(@y=R9c@{(%RVZ@}#�W.R�@0S�oW�@���!�f@��<򵶃@��㾩��@��y%b@�1)�p�l@�g����@�������@���CM�3@�=���@��Y��4@���:�ˆ@�bL�:�@��٭UN�@��~f�ӻ@�l��q�@�4�}. {@����j@�ӪdN��@��t�k�v@��6c,@�f�0�@�L���X@�7=���@�&��TΛ@�&���@�G�(�@�?,�@��[>@���C�a        ?x#R��U?��R�T�?�1�K?��Լ�?��>��&#?��-�^x?�q=��_�@Lv��,�@
�,�Y�Y@����@*L5�@���G<�@����c@!���e��@$ӧNR}�@'�H�L��@+9�׋x�@.�d�)�@17�|�@3+D+=e�@57�Wf�@7\�^��@9��.���@;��%�@>b�G�@@u��F&@A�&�+�\@C'��)��@D��h�@FL��;@G��B��H@I8ӌЄ�@J��g�@L�r~�@@NiNK.@P"h�ѿ@QQ���@RbI���@S(ؗ2�@T%�jt��@U9Y�wn@VTf��N�@Wvg�)��@X��8A�*@Yͯ_���@[}��o@\;�^v�c@]z����@^�R1�@`�y�@`��Y�@aTT�Z�@a���N[@b���њ@c^8��t�@dȚ,�)@dŠjV�@e|�H��G@f6��@f�(��@g����r/@ho�>�n@i20e�=        ?O4��)+�?�з��`?��-�?�c
Y��|?�Ȳ����?����Л�?ӚQB�e?���р?��*��D?�݃K�c	?쌯���?�y��'�?�
��\M�?�����?�[ (��@���7W@���/�P@�J���t@	�#���@���#B�@MY�4u@C�R�t@`/��@�ï��i@İ�@�W����@��W���@ �t� �@"bl�-�@$钕�@%�K�!�@'�s�"��@)��8�Fy@,'��0�@.}� ���@0|j��@1������@3/P�'�@4���4�@62�����@7�A9�@9�0���@;X���@==+)m5@?9��@@���҄@A��ٴ�@Bߔa6J@D���@EK����^@F�4�A�+@G�&��i�@IP��NF�@J­��Ę@LB���L@M�H�	�?@Ol={��@P��4_�@Qf��z�@RI�d{�D@S4)L&��@T%���Q@U̦        ?i0���Q�?���	/?�LN�$�?�Pl#"mT?و�e,�X?�ۡzy4?���Ԇ?�#��B<V?��Ç�@��y�){@>�I0O@"�6m��@G����^@F����^@�Ad�Wu@0��@%N��G@!;�^�+�@#�f�o'f@&$�w\2�@(��@+���d� @/ ��xp�@1K7�^Q=@3%w(ho�@5㎯օ@7;EH�@9xaM��@;��n��Z@>Z�|qZ�@@��h�y@A��v�d�@C_�jL��@D쁓�G�@F�z���@HB[����@J�ե@K�'=`2@M��mn�c@O�e���R@Q��'m�@R0�����@Saw`�U�@T�v޺b@U��'{�@WY4�|�@X�"v.�7@ZY���@[��5��T@]��p,�@_f���P�@`��A�/L@a�;Q�@b�5��	b@c��[U�@d�����@@e�;�oz*@f�׬?gC@h��ۙ@iT�*D��@j��JU�@k��v0�@m@�W�E        ?�5��RF@�� �@4N4���@Gp�N@Us�Mx@a%�W�@h�l	���@p�YY��@v2��*[@|����@�Bh��$5@��UN4�@��>��X�@�ҫ 7H@��� �!Y@����6O@��E���@�9����@�	��nn�@����U�@���<�@�%��a7%@�ӹ��v�@�����@�d!E��@�Gn���@�=� Ϩ(@�G#�w@�e�$]'@��3A,�@����az�@�!JRXQ�@�]��^�@����*@��w�<rG@�Z�j[�@�Ɵ�Z|:@�=w1k
,@����y�p@�Jֳ�/�@��Y�Lz@�����B@��-�C��@�l�/���@�H�2���@�(�p��@��G)�@���a3�@��k�`$�@���|�-L@ȳ�u�A�@ɤ�=>�a@ʘ./K@ˎA����@̆�0�sn@͂SѲ�*@΀K��@πݖl��@�BIZ�@����'%B@�I�*��@�Χ�=��@�U��%�L        ?S�?3�e?����P�?�Q�1i.�?��4�l�?�2����Q?ڭa.���?��9m�?��)V�S?�d��%٭?���p	��?�<�N�@üp�#�@1��yN8@畼�"N@��y�@���ny@�"�|�@E����@��?�!�@��sT]�@[an��@ *���8u@!��J��u@#]H+��@%t�5��@&ڍy�@(���7]@*�MxQ2@,�QbϗO@.��M� �@0r��}G@1��$�[�@2���_/�@3� �$�@5$Ԟ�V@6h�-,�@7���ƛ�@9�!�ԗ@:kZ�B(@;�+���@=FT	��	@>�4_!@@#�0���@@�ZAU@A�HƨN@B��s�[�@C`�q1�
@D<W�	��@EL�޿@F�v2�@F�JJ]@G�/�dH@H�Ņ�m�@I����e�@J�8Y�G@K��3g.@L�T� @N��q�3@O&�2�~@P%���}@P����@QU>H�;�@Q��~��        ?S���a�q?�܉7�7�?�go�g�?ë�t�(i?ҨE���/?�Y�����?�^,����?���.��?�D���!?���n�G�?��z�E�5@C@F�@T@񡗒d�@
���7@W��|@=���z@���@iS<�Y�@l���i@����P@ �LPR�M@"z�~�@$���.�@&��S�hd@)
(]� �@+�Ņ�^[@.?;���@0�*���g@2��}�@3�Oʎ;@5}���i@7Z+��o@9U-�� �@;p�?�}�@=�U]��L@@l���@AM*W��6@B�|s��@Di�Cx@E��j�@G8/�=Z@H�;v#��@J�Q�KN@L���k�@N��ܯ��@Plдo�@Q���@R��#>�@T$��>@U[��F�V@V�CF�}�@X=(��; @Y��l�ަ@[iv"B@]~�yB�@^�*�le@`^�(��@aV>O�ر@bWԀN8@cc�*N��@dz0�
Rb@e�<�L!@f�
���        ?���؅]?Q>�W��?p�-���?�i�;�δ?�]l���?�c|4��A?�Ĵ��s ?����\?��x}�^�?�����lA?�ZX�*�l?�͏�;�?ՠ+9�l?����b�?��K��?��n�.?���K�c?���ex�?��Y�7?�'B�P?���%*
�?�O���@ �F�J�@����y�@p.��5@	�<�b�^@8љ	��@��܆�q@��t�1@B2C��@��uG��@\�-�'@^^�y�@ OV���@"��a�+@#�j���@%��8��@(-�T�U%@*����@-���ѣ@/�$r�r@1E�8��@2�m���t@4ewWwž@6�c��G@7���7@9��J���@;�Bc��@=�Q�F��@@N�OA@AO�{n�a@B��fm�#@C���'@EC-&�x@F�7Ԟw7@H=�n2�@I��<�Ux@K�S)S�@MC��X��@OvW���@P�ޓD|@Q�m�]iL@R��L*        ?��B���?�K�&݌�@b�LO�@/g:Ik}�@>�-tB@H��b�s0@R5�Z�@Y3�v���@`������@e�E{�@j� Ƙ@or|t�9@r����C�@u�x2ԏ#@y��@|�	gTR@�5'�^	�@�/ ���@�B�f@�p	�@��Ǿ�@����@�����Z@�R�x�@�i	���@�̻O9��@�=xq\��@��N�Me@�FB��H@��I^�>W@��A���@�4��Q�@��*Y@��R$	v@�ɢq2�q@��Mk4��@���\�T@��8u˫�@��T$��@��՜sS�@���k��Z@����;~@��(s��@��n�@�$���=�@�Kj|�|@�wg�eX�@���".*�@�����@��~E�	t@�0k��@�ԫ�7i�@�|�z��@�(�Q@��qPy@����h��@�@����@��d�Y#�@��Z۬��@�}��қ@�EXο�@��!�V@��GH�        ?ulfF%-�?�΀�ao?���T��?��B�Ħ�?�����X�?�S*L��?�E8��3@W���t�@���&m@�%9W�C@��ƘS@��ӆ@����@,^��@!xiDƗ@$�Q�t@&������@)�v�vr@,�ӰQ�@/Ү�f�@1����-�@3U����w@5)��.r@7롊1�@9
��J�@;5�k�@=5�vɶ�@?e�ݰ�@@��*�C@A�d�<��@C/z���@Dj&��@E���{?@F����@HKXCK�*@I���@K
K�g-'@Lu��\�4@M����y@Ofs��U@Pu�>.��@Q=ӹj@R	O?%@R��}&��@S����v�@T��<_@Uj���@VP�XMA@W:�!�>@X*F�3�@YR4��@Z��q@[���S@\��;�@])�-�h@^9�Y��@_O�Xػ@`5M!�T@`Ņ� �@aX`��}Y@a����sm@b�����@c DK^j        ?g�J�}?�+Aљ��?�]�-��?��fx��?�e!���?甿#9\�?�K;g�N�?��C��˕?�}4j{�@�P���@	w���@�Q���@H�B^/@��)yiE@>�TM@.�����@ �&�h�@#�p�`@%w�*�Wz@(�'���@*�;-p��@-����@0�0��6@26�?Կ@3���2/�@5�/�D��@7����XQ@9��0�2@<$�E�+�@>sF��9h@@oA��8r@A����2@CF�O(�@Dju@��@Eݛ�ro@Ga"��@H�W|߀B@J��P��@LQ��f<�@N��Dh@O�M:�7@P�`��u�@Q�t	�@R���?θ@Tb8�4�@U4��Q==@V_o��]�@W�E���@X�5���@Z"h.� @[z��Բ@\�47�i@^L!H�f�@_��� [�@`����i@ap�%<wH@b@i)ځ�@c����@c�(���@d�>uJb�@e���@f�J�1�@g�q�s@�        ?Y��8F�?��q��%?����ƿ�?�f�b	��?˽�j>��?֭i�"7�?��9��?���"�?�hx>��?�2�v�j�?�G�0�H�?���ἓ8@�xɳ'�@����r@	�rrj��@��t@O���@��%K@e�x��@<���Se@GX�d�@��:!q@!�T�A"y@#Y�t��@%Pꤐ��@'g�.-N�@)�E��@+��V��?@.vlӐ.@0����U5@1��	�@3moo��@4�I�i8t@6�k�o@8g@���@:AQ���@<6�"���@>H��@@;�1�e�@Abf�U�@B�Z� �Z@C�^C֩@E:	u���@F�Y0�T@H"�3���@I�ׅ�<@KX��0]M@M�7'�@N�{�^
@Pd5 W�@Qb�]Md�@Rm_F4�@S�fAc�@T�D��
�@U�a����@W!�u�M@Xd��g�[@Y���||@[*�K� @\�B��'@^+��T@_ā�f�b@`���V��        ?�PA��g@�)nz@0�:�A�@B�Ƴ6h@Q*��Z�H@[9[-�J�@c�!��@j�ͪ�>�@q��̇�@vJ����@{q��u�@������@��F�A9@��Xu��@�h���6�@�'���@�s_�9@�&j�{�@�Y@1g9@��9����@� ���w@��7�,�\@�0t�6�@��~Խ�@�[���u@�ϡ���T@�O�kP�@�ی���@�r��R��@���ل@��>g��@�{���M@�?��P��@���L{�@�sW����@�eN�=@�\	^��b@�XHe�@�Y�b�@�`�ޅg@�m�?V��@�����@��~���@��@F��@��Z/��=@����B@�9ι�B@�rD��AO@�X��g�B@����o��@����JC@�Kj��@�����r�@é-ڨ��@�]U�/��@��Y��@��=�Pq�@Ǝ���@�Q"�X@��P��@�ߖ�H�@ɫ� ׉�@�z�7y        ?7)��RK;?lA�����?��~M��N?���n"��?���T�:?�k����?��>�ϻ?��3���p?��RAݺ�?�f�����?�k
ܦ��?扒R��?��)�1?��gj?���A?���R�F�?��u��c�?��PN�Mn?�]�DY�@��X0U"@}q�K�@�r�kx@��G5 @	��
�@_;+�@��ɋ@�Y���%@h��r�@rmȂ@�Ay�n�@^�r(�@���$�@}��7@Ʉ1�@���6[T@��i_@ '�JH �@!>���@"��O~@"�"��@#����N�@$�|���@&����@'�ΕE�@(3Da��@)S��ý@*|�Q�@+�J2:@,�򟜲@.$��@/l��B�]@0^���1@1�t֬�@1��Q�0@2r藞_R@3-(�H�@3��!��k@4��I�/@5vzc�&@6Bf-�1@7���U�@7�h'��@8�urO�R        ?L����?SAO��5?v�#_U�&?�l����|?����P!?�`�>��?�VJ�5?�2�8��?��Ac�?�0B�X�?�.-�k�?�+�W�?����<?��N_v?��ih��k?�:��ԉ?���ھ?�@��Â�?�B��x?��"��@�S�Q@�L�v�@�q��@�Y� �T@o�a�@�{�W@Nt۸@��ZK��@� 3H@����@ N�C"��@"=�o�@$Z�
�B@&�؆��x@)1��6�@+�[|?�@.�4�;bQ@1b}Nih@2�U�7<3@4�$]%u�@6ˉ?�5�@8�O�w@;ZS-t��@=�Ti�O@@J��~nr@A�ǁ(*`@CGN�!`@D럝��@F��Jc@H���@J~V�_�@L�ޔ��@NʾnOI�@P�����@Q̅=;@S���e�@Ty=[Z?@U��6M@Wo����@Y��L��@Z�B��@\t�%�V�@^J����        ?2���[X?cuM8<��?���Wȴ�?�@80�o?���r?�O?8�?���k0�?�B3�a?̧���?��O�;��?���qu?� �x�\�?�mb�r�?斴n�?�.ő���?�4��{%g?�+�y���?���F��?�L`SP��?��هz@�@��+m
I@Fp��>@3�+ 1@
pdC�;�@>�zY@�����D@���*@n��s�@��@���\�@���:��@ qͱ�OS@"*����@$W�W�@%�D�bۋ@(ړ"�@*aZ%O�@,�_�R�@/]����7@1�Z4�3@2��b8�@4�{�@5�M��@7i����@9>�W�>@;.�J�s�@=:Y(V�@?b��6@@�Ű���@B�Zt@CJ�=�S�@D�F�β�@F<�]6�@Gz�2L@Ipグ @J��L���@LP7c�(@N��=߸@O��fe@P�9�E�@Q�H>�?@S ��a]@Tfs�6�        ?��m��1k?�*�c�?�j�8�]�@�%,��B@��h��@#��Z��@.UR�)E@5]zH��1@<����Z@BS:���@F�l�ѣ�@KϜ�F�@P�@��,�@S��Ͱ3�@V����MN@Z*-�h�@]�rN�s4@`��u��@b��\� @d�B@v�@g#
� �@i}���r@k�xf�@n�N�:{�@p��Z_�[@rp[pb�@su�p�6@t���K��@v�4��P3@x �v�M�@y��A@{~l5z�@}@�G�n�@n�nZ@�u��?�@�i���g@�d΂��@�fMn�p�@�nv����@�}W��!3@����w3@���8��g@��4��@���8��@�/���}l@�i��v!@���F��?@��aԊ�R@�"�$ ��@���Ub�@��Zէ3 @�7!&�
@��ehݗ�@��1��u{@�s�a�hb@�;k�:Z�@��+/@�ؼn���@��II��@���"zھ@�fHe��@�I�:�@�0>eLU�        ?P�4.V�?�3��؞�?�b? O�?��whK��?ů�� ��?��T!3P?��e��$?���ޛ��?��ɘ�/�?���)�k?�������?�_3^��?�*f�|(�@/�mQt@���yi@IF��W@
=g�:��@�lY�q�@��5�[�@�˱Y�i@��$��@�t���@�R2֚@JkG�_�@�g{l!@ M$�xX@!i�#_p)@"��C 3�@$'P�c�@%��6E�@'���@(��/��@*$��qW@+���ݠP@-`s�Y�@/H�!!@0bd�N�@1C@W_��@2)n���@3�@4MKP\@4�N�cX�@5�7K��@6�����@8���@9��m�@:)MV���@;C��$I�@<c����@=�A�p�@>���筑@?����D@@�*�u�@A,l��<�@A͛��n@Bq�F�=U@C�Q$t@C�i���@Dpcg��c@E �m���@Eԑ���@F��ȼ�+@GE��}        ?2� �r@3?f�ͪ�R�?�f��wc�?���up?���%*lA?�{_��a�?��q��ܑ?���-Ay?���e��?ӬǷ�<?�@%2��?��P�ua^?�uh�?m?��Si�?�!�岥?�uq֡u�?���I%?���v��f?�� �~Y@ ưCp'�@z~H7$�@�MN%2@	�[���@�ȶ�T&@��&A�@D4��L@Ҿd�t@���9L@�l%��@9�Y>x@![�	@#V���p@%|?:�^@'�E���@*N�e��@,���[G�@/�pN�W@1}�F2�@3%���;�@4�=JP@6�et��>@8˼�C��@:��c�`@=,��c,@?�D� /�@A�3J�Z@Ba`B%�@Cʗ�I	9@EG�:� H@F�&��Է@H��t3`@J=	`y6�@L�[Z�@M�G�$@P ��^@Q�L&7@R*I��G�@SSw�k.@T��K�G @U�W����@W%�&' @X�4�v)�@Y�d&��M        ?H!$[�?y�o.��?�Z���s?�#���T;?�W��Qx?Ȫ�;On�?��zM�ē?��~�?�Sh��L?�Q��A�?��jA�K&?�L�눫?��W.OH�?�Ҍ��?e@F\e��@|ќ�IU@ȱu�@n�+�@>uU�LY@���0��@^H�D�@PBV1�@�����@\S��@!nx� #@#|x�g�@%�-�UgF@(&i&ąY@*��2[x@-��1z�@0GF�_�@1����R@3�u�ٞ@5u���=@7mi���@9�(Z���@;�鑯�F@>�B
��@@PG�4��@A��te�(@C
ե��@D�����@F��z�@G���,-v@Ij��Q:�@K7���8@Me�rKH@OжH#@P���(�@Q��Q��@Rǵ�]�Z@S����?@U/����@Vv> \1�@W��[�:@Y-62�,u@Z����1@\XDW�C@]��]��@_F�A�+@`x�Vn��@aVL��5v@b;��1��        ?�X��I�<?��B��@`v�Ex@!N� S=@0���M@;#����@D;���� @L2���b�@R�_��п@W�����@]��w�!�@b$�3wl@e���(݄@iU���e�@mb�a7�@p۟��ǹ@s)��w~�@u��Kt@x1�1��@z邇�Y@}�-i��@�^���@�� ��۫@��E$�D�@�6JT�p!@����g�e@��VںG�@���0A��@��Q<�G�@�w�f(�@�>�x]@�F���N@�U{�o}@�j����@���;QQu@����6�@�υ��%)@��a��.@�3s�K�1@�o� �=@��H�r^%@��5��L�@�P�앋�@����5�@��U`�P�@�:��NR@��^cV��@��k�}6�@�o%��x�@�2�j��Q@���e��@�Ěp�W[@��`V�0@�fd��@�<�x�B@���N@�� ����@�ڮ�ꨮ@�£ ���@������@����@���(��@����,�1        ?V��Q��?��~b�?�G�Զ2�?���c �?�R�6;�=?���~��w?�Ql��?�ʥ��>?� _D���?��Rp?�Q�Z?@ �6��&@���:�@f�+�o@0����3@>�k4�@��ޕ�@���@z��>��@�v:��@���y��@s>�9N@ �OT�N�@".$l��@#��}��@%^%G��@'�7�D@(��m�A�@*�����%@,i����@.O�@���@0!܀�Tc@1#���@2+���@3;���.m@4SB�@�8@5rM���@6��(��@7���e�@8���e��@:9�fw�o@;~I���@<�n"�y@>Cu=De@?y�Ԥ@@n)�ȉ�@A#=
�+@A��*]�@B�;�g@CX�� K@D9�m�@D���7�@E������@Fx�s��@GIR��@H�I���@H���L��@I��ґ49@J��l���@K�R���w@Ln�$0&@MUb��O|@N>��Y�T        ?4a
bl�(?l���Wp]?�j�¦?�]�ޜ�S?�Ȇa��?���g�?�Q[V��?�i�k��!?Լ�.���?�Y�0��?�*P��?�,�SV�?��e<?��\�V�?�m���?���@2?�6����@Fn��S�@M-���@��E��@��#�1@��蹍�@Z� ��-@	�3�Z@8�
p�@N� 	�@��7��@!u�aF@#�hB��@&,��{�@(����u@+n�lk>@.z���~�@0��1�@2��:��@4�n�_rI@6�V���@8�G7zx@;%�辄I@=��g�@@&��ql@A��r�g@Cp���@D�0����@FY1�(�@H"j�H�@J�T��S@L~�酹@N`9-uk@P+�n��@QV󁣞|@R�ò޺�@SܬI!��@U8$pQP�@V��3��@X"�PP~�@Y�b3͙@[T��#R@]	S�֑	@^�C��i@`V[[~@aN�N�@bOښ���        ?B���	?s����]&?�*��� ?��l�(qI?���{�?���X�?ɉ�jf{.?��H�4g�?�ܿ(�c?�ՂE��?�n�[��?��vt�?�J2'� �?�}#ݏ#?�"�qi�?��Bu�g�?�� ��(@ ��2:[�@�h���@~�f�+�@	���60�@<��r�B@�RG��f@��e:�@�K���1@k&g�o@�[�֩@���f�@ ��TA@!��)[�@#�����@%wBҗ)@'���}.@)�I�hMt@,%�G2�@.��'3�@0��Yj�@2+���:@3���-�@5]*F&�@7v7@8�T���@:�:M�-@<��V�f�@?&wa��@@�hC��@A���C�@C0�P�/A@D� ь@E���I�@G_�p��@H��ň�:@J����@L*w���@M���>@O�1,�@P�ȑ%�@QǙ �u�@R�%K�n`@Sڔ��@T�Щ��@V���1@WB��1�        ?������?����p�@ZF�D��@"c�Q<��@1o�Q�o@<�m/(p@E(-��ԓ@Me�i&v@Sv��cP�@X�9S�5�@^�I��@b����W&@f_,Ց@jH��-�@n}�����@q~S�ka[@s�>���o@vi���߈@y���k�@{��.�@~�~�*˃@��G���@���ܓ:t@�0���r�@���ۉ�x@��1��۽@��I���w@�j�D@�X@�]�cD@�^]�P@���7Nf�@��K
ˠ@���g5�@��^u�e@���A��@�J��!�1@��`P�@���f��@�X��ϙ@�O�d]X@��Vk�mk@��\��@�i��@�k����Z@�&�&�@��֥v�@��KQ�B�@�pF�NZ�@�:�	Q�A@�	1��@�ڬS��@����Lʀ@�����T�@�b��?Ǻ@�@����@�!Z��B@����@��ϔ�u@��(��`@����G�(@���:Z@@���L��@�K��g�        ?p����?�J��� c?�i8-��?�3�Cv��?� ��IS??�<ʸ{�?�v�W4A9?�]�:m@��0`�@4k'��@��;v@�L�_l�@b��c�@T�ߗ'*@��q6�@! 	 ���@#�R����@&DaVK�@)Ps�@,�],@/@ ͞2+@1K?�@3:��H@4�˿ŗ@6ѻMg�@8�~�FO�@:�%I�Rw@=$�Uvֆ@?n�Y<O!@@���8�@B#�N�@Ck�z�?(@D�Wm�$@F���4�@G��3��@I ȸ9׬@J�oS�'@L�3�j�@M��I�@OQ�y�D�@P�����@Q`GV�@RDΞ��}@S/8�xɟ@T��O��@U��{�y@VɈ3�@W�U/8�@X�[�D�@Y)��_M@Z=�y8*E@[W��KZ@\x�xq�@]���!*@^�5��b�@` ����}@`�ԣ��d@a>:Ì,@a����@b�o�,|�@c2,g.�z@c�����@d��3�[�        ?2K�<��5?f�e?.��?�-Up���?��|Vn��?��S�v�;?�k�$4'�?���I|�?�bօ�	=?С8��0�?��֏UYf?�&FlI*�?��1��K?�䄬��=?�[����?��Z���?�.����?��dW��?����҉�?���*��@⻙/(�@��� :@�_���@
�j����@K9�>�Z@1Vǧ@0�+�@z�	�\�@�� W�@���D:�@�\��4�@ Q��8�$@!���cl@#Ɓ�E�c@%�ޑ�hX@'�{y1�@)�tb\�@,6&{�H@.�|�m5@0�cXԴ�@2-�F�@3xF"e�@5R��t@6��O��@8W�hh�v@:$[y�M@<H c>@>]�@@0lxĈ@A"�3�I�@BFC���J@Cv�?���@D�����@F 4�s�@GY�6~�@H���hP�@J7�=��@K�%��x@MQ�3E�l@N�`�mO&@PTvi<`@Q694#vy@R r[�@S<]�	�        ?rᩕZ�?���S�?���1��?�j{7�K?��܉2'?����V��?��T5.`@lb�kx@��@_�@֚�@�~�%�|@���u@!ac8�@$ݯ���@(����E@,�Iv�S$@0�K;��~@3GOTq�@5��*��@8��u�dG@;���?@?G���9�@Ae�@��@CA�����@E9W��05@GLw�@Izj)���@KĿˬ1@N+aٕD@PWPh�S�@Q�dVy?E@S�w�@Tsm)@U|��@Wz�XQ�@Y��&@Z���k�@\u��3��@^<��A�@`	\�$o@`����H[@a��"�@b���2Y@d �3��@e�,V@f)Ь -Z@gI���u@hp�<8}�@i���ѻ�@j֊�lZ�@l��^`&@mZ�!�@t@n��-'�U@o��'�U�@p�V��bY@qaSr�H@rfd�ށ@rӚ�.�Q@s��Z��z@tV� ��[@uf��@uꆺ���@v��	@ۅ        ?�{���@�&��@*�c��i@@���@N�[9��~@Y	*V��@b�a(�&�@jR�8w�@qd�<�@ve!]��@|�f=�@�.i|��]@��vU�:%@�zy�h;-@��))ޞ�@���no�@��k��n@�}b�OQ�@�4 ���$@�Qt9�@��^�	�@�����0�@�P�5��@�e�(@��_�Q@*@�ʪ�̆@���m	5@��F���w@������@�-V,�@�>�> �@�n<'��H@����\@������@�;�X�[@���*�K�@���ER\�@�d�����@����|�@�\�ϑ�T@���$���@�>lg0�@�í,&�@���5�&�@º���@Ø�wW@�{O���)@�b���>D@�N�*�s�@�?;"0n@�4�8:5�@�.�JU�2@�-��%\�@�1A��	�@�9�����@�F�Mޮ@�X��~�@�n�1q��@�E�FZ@���-y��@�fԐ�b@��=WG�@ґ��{C
        ?J��a-�?��1߷H�?�ا1��?�a/g4�b?�����?тmp��?�ai�=n&?���cIH?��O��j?�+|\�M?�Ȉ�ȍ?�#
;�?��^��`�@�,�}�@�S�@�|�K� @
/Ϯ{��@�\�|�8@��N�8@�����2@�.�uq�@���h�a@8(�hT@�D��_@(%��G@ f�Y�k@!Ɍt���@#<}��!<@$���X�@&T��3)�@'�_�n�@)��e���@+z���M@-V-V��@/D1q(V@0��Ag�@1�����@2��}�@3�Dkk�>@5�C}@6;�ÓZ�@7y�ٱ��@8�"Gރ@:W�<��@;v�sM@<�D��\@>W#�F�@?�8ﵤ�@@�s�ߜV@A~��t��@BP���@C)	b�@D`���@D��
`N%@E֥�k@Fǟ7���@G��W�aF@H�C��u3@I��B!"@Jɢǧg�@K�tEJJ�@L�>�Ms�@N
�G>��        ?1�pk��?p[��%X?���-Z?�����?��cp�i?�� ~���?��NY���?ۄ���?��=�%j?錸��
�?𒗞�\�?��"��Z?�!�I=��@  �$s@Wh�'�@���[@Y;��g�@
m#�@�|L�e�@�w8��H@���DN@Z�YWuE@ ;��Vc@"<�ʮ��@$��֗��@'�In��@)�E��m�@,��[�J@/�:��o}@1��̵,_@3i�u5�;@5Y�J��3@7j�*DzN@9�z��f@;�Y{2}�@>sn@�Z�@@�u�S�@A��%^�@Ck�t��@D�_� �(@F��B���@H[�Vt�;@J/���5�@L��{��@N!�z�|@P!�N��@Q>�f-4@Rj�m�#�@S�'X���@T���@VGP	�C�@W��Z�v�@Y(��sw�@Z��DK�y@\K�|�ϧ@]�]�0)@_�a��p@`�����@a�f`|�C@b�}�vR�@c�+c��5@d��J�r#@e�Kde�        ??��4-��?r(t��j!?����'??�|��K�?�&�P~(?���tM?Χ��)�?�%c?�r�bM�?�.��ߡ?�t��?�i�O	1 ?�X�f�8E?��	�xO?���<���@�z~�@��dI�@�����@�C� �@�s'�}�@%	<'X@�1���G@)ʈ'��@ĺ�?�4@ g���@"��H(�@%��xWQ@'�U.ޢ@*����ߣ@-���|E�@0�١�(@2?�<*�s@4H_��@6O$��@8;V���@:C^��L@<�#�Z��@>�H�u�@@�Kw�~@B�cw��@Ci��e�6@D�t_a)@F\AB�1h@G�c���@I�Y�p3L@KK�o�R@M�@�IA@N�|o��@Pr���@Qu�9$�@R���n~�@S�T_�v@T��+��@U��@@W(�!���@Xm�U�;@Y�Հ�uU@[a�)�F@\�����@]��=�
�@_xGsB�@`�kEҮ�@aN���        ?��C$;?�.H
�_r@��1 1�@1]'Sd@-��� �@8�D�u��@B�Tx�o@J�"����@Q��ݖ��@V̦@؇Q@\�E��z�@ai���%�@d�c��`@h���l)�@l�࢖W@p���y"�@s�O��@u�O,7�@xNd��x@{2�V��0@~A�y�@����a�@�pCZ��@�8� y�@��S=��@���@���l�@�C�Ғb�@���Tt@�n�G ��@���=@��Q�D�@�C�3�@��ʩ�5@�h��;8@������@��P>��@�����q�@�W��c@�p�$�@�g�?�C�@�Qy���@�A��^�@�::���@�:GI�)-@�BFܫ�@�Q��~s@�h��ᩉ@��b@��,2@��Q��}@���t @�U�r�@���[m��@���8]��@����j��@�S2��+�@���Ӣh@����w�@�}�,g@�?B�?�@�����=@��M�$�        ?TQpȮf?�
w'�1'?���(ȩ�?��cFX{?�݌����?Ӎ���?�DՌ�?�/�"/>�?�b�K�?���n'�?�/�!�?���I-�??��l:@��nZ�@�l���@��L��@Gк�&n@�꼪K�@9j�6��@*\c�(T@4���@YiחI�@�B�.@�)Jo��@eþ�@ y�)fZ@!����D@#1��M&�@$�ɰ�}9@&!���@'��p�I@)I�b>@*�(x@,������@.r*5P�@0#z�e�@1 �m�@2�	��w@3"�c(@4�Z��@5 ��zEd@64�󏅯@7Og�x�@8phNq�@9����	@:��$.�@;�D��@=1�2VN@>p�Q���@?�H����@@�����@A'��	��@A�>B�	�@B��7�d@C0&����@C�t����@D��_į�@ER��9]�@Fd���@F�G���i@G�tf���@HU��� �@IŅx�W        ?���s�>?RD]�;�?q�a;�?�rj�?�m�u��?��&�6=?�[e�Gw�?� ��T�"?��Q� �s?�I�Wv(?�'a�jsK?�f�c�V?��`9;?�Pw�nD�?�]{����?�*���h*?��0'�?�7$5��?�xn�+�H?���1�z?��ß�?���h?�����@ ���M�@��M��@aF~��@~GG�@�/^��@����q@��K~@3ы��@�� &�@_�rYR�@L��2.N@w��/�g@!ry	m@#K�?��m@%H�ЂK@@'k�]��@)��p��@,+'�\x�@.ʪa`<�@0˕�%@2I:~�{@3�.�!@5�]k%>�@7W��P;@9<$��@;<�K�׉@=Z!P��-@?��� �d@@�K�@B5WL$Q4@C�%��Az@D��
�B@FR}B�
�@G�Z��@Ijk�i�@K�����@L�Z�y�C@N��10@PB��2�U@Q@\�d��        ?S.)�v?��"O?�'.��r�?� B�	��?�����?�&�O
�q?�~�N�֛?��t�?�yz`e@?���@�r?��~���?������?�@l�?��@ ���׷@��g@�s��Q@�W����@h�Sdr@2n���@�<�,�@I\�t��@�͌>h�@)L���]@�>�b�l@����O@ �j+3y@"�����@$_�bB�@&B���E�@(DS:�U@*e4�17@,�7���x@/\�~�@0�w	:"�@2��@3��:�PA@5@�{YY@6�?�o�c@8?���
�@9��ݒ��@;ӟ���v@=���o@?�/�!ɣ@@�����@B� �V;@CE�db�@D��^��@E�Q�f�@G0pmLU@H�E��Y@J�QQA@K�x��7@MM0�v�?@N�I��i�@P^�H>!@QGq�-�@R8O��@S1��=m�@T3j1|��@U=��@VQr�K@Wm=���@X�p���        ?�5tT�/?�S�>�@�c��V@!�u����@0�v���X@:��>�]�@C�b]i�^@Kl!�C�@Rq��N@V�ts��<@\:5H�D6@a
B�I�D@d5�(���@g�:�>�@kC.��:D@o"���F�@q�[�=er@s�{�I�@vvyr�0@xqp�@z�ezA�@}�c"J�%@�#K�xs@��f�ܴ�@���?@��oU�@�'|4��@��J�0�@���*��z@�EZ;N@��3tڥ@���W�@�t~�ԙ/@�s�R`�j@�z���a�@���:*��@��!@�@���P��@���"6��@�L�c��@�9wКk�@�q\���v@���9 �m@��ͳ��4@�@�8�@��m,�{�@�tf��FM@�#��*z@��t�!3�@���bz�@�?�Q:�z@��rx@��ڎ6L@�urݞn5@�7ȐM,1@��S��@��V��n@������@�^��O��@�0V���	@�� L��@��K��@���u63        ?_M��{?�:ϭ
w?�<���ݾ?���?�}�d���?�v�q8;I?�3��H�?�G����?�e�fj�?��X��?��'?��@��Fx)�@p��ʫE@
jhiW}�@��--s�@��%�@��7�@�a�I��@v�yt�@`���@pv�2�@!S٢�$@#�D�@$���*��@&�m7�_<@(�?��R�@*����@,����.�@.�弲��@0w�����@1������@2��@4#Av��@5]"2!	�@6�#oe��@84e�I@9�U7�HH@;}v�@<����@>���1Z@?�}�@0V@@���$�[@A���D�!@Bn��LG0@CUx�ݏv@DBm��1@E5�d���@F/?�}�^@G/a���@H6k��Q@IC�[�#=@JW���Ǧ@Kr�3 *�@L�:�Z�@M�����@N��hZ��@P���@P�Y>���@QQ��D�@Q�
�jN@R�s��!@SJ&,h@S�.SS�        ?��IY'?R�·�F�?r����?�W�_ L�?�:����E?��>*��?�#����?����鴀?�ffl��[?�.)q�?�	�*t ?ұ�V<b�?׮�X�?ݕ}�3�$?�B���6z?�N���?��a_�;?�1 +�P�?�E�[NA&?���+lM?����� ?�&��-	@@[��@�!7�M�@�v�2�@6�"}2�@��f�(�@yx�/�@�����@"zя�@�M#��7@w��ņ	@{ﱆ�s@ ܚ��^�@"����@$s��@&l��Z��@(��ju@*�>��5�@- \6c��@/�X�s>�@1$�]tr@2���gn�@4�nCm5@5� ȻqI@7;4�q��@8�z2>�n@:ȧRK�5@<�k�G�@>�qy&�@@g���i1@A����d@B�-�`�!@C�ڜ�-�@E B�$��@FpÆ},@G��]��@I=��m�@J��~���@LG��W@M�Q�?�@O���I�@P��v�
        ?FE�m@ ?vt����?�J_W��?�,�B�?��D�/��?³<{x��?��gY�"�?Ӥd��?�b\́3�?�$|P�?��*�L?����g?�y�p2F?���lqQ�?���p���?������@ ZEÐ:q@�yE��M@�i���@	!�֑��@�-���@D\k�{#@a^�qoA@����@0��M@�����@�C�SҒ@ ��U�p@!��ڑ��@#��)���@%����{�@'��!M\;@)����s@,hl��+@/��'�@0�:]tH@2[��7xJ@3�?~,@5�^?bh,@7Qҷ5�@9*R��W�@;���f@=)f���@?Q~�Mc@@����?f@A�W�X�@C:�߽�@D�*eZm@E�3�gC�@GU�U@H�>����@Ja�U�&@Lz��;@M�7�#��@Oth��D@P�#��TX@Q�ơP|@R����^@S�✋Q@T��Gn9@U�g��{Q@V���;@X�:�B        ?������?�ӷ��@ 5�T�@"�Ì8J�@1sdg���@<iNB��t@E	��w��@M/���@SN�඗@X��9���@^�.�TI:@b���8@f.T�rb
@j�M)t@n>���@q[ts��@s��;\�O@vC	e�bt@x�(m]�@{�ڨZ�@~��Q"�@��Xf~�@�����B@�4u�/��@��d�#�@�̵\H�8@���Y�@��3!0v@���3yv�@��#
���@�	�6,F@�.y4c�@�]����@����-�x@���sI@�+=Ї`w@��"���5@�����@�X��-��@����R9@�WG��f@��AȽ�@���ӋB3@����54g@�iM����@�F9��z@�(Ը��@�A����@����6�@���b�g.@��W{���@��͔A��@��^�4GJ@�iwV�@��#��@�-�K�6�@�L�m���@�q�v&Yz@�N_vo;W@��ެ}�L@��_�S��@� ��+�B@��x<��        ?m�P�#[?�'��OC?��v#�C�?�Ճآ_?��B�6*?���S�n�?�&:D8��@ <~}��[@�ҷ��@����@d1��	^@;K�aN@qB*�Ӿ@�h�=@!|����@$%��	/@&�B���@*� �up@->��E��@0S��b�@2 Z#\�@4�!�D�@6����@8��'Y@:Mq"z��@<��"�a/@?�Q9�@@�7Y�x@BVB��@Ct�b��@D�q�z�@FfY\��@G��~ުy@I����7@KNL�@Mz���@N�%
�\@Pi%��l>@Qe�Q��@Rkiؑ��@Sy�;O@T�H�۟�@U���F�c@V׫ �Z@XT�^z@YA����@Z���T�@[�S�M"@]!�����@^}��7@_⧒,o�@`�Bj�f@ac����@b#�s[�@b�?#8�@c�'��C@d�U���6@eS.|ʔ�@f*�+L:@g��Y��@g�`&6F@h̊QY�@i�3��        ?B;���{1?ↇ��?�m�3Q2?�2VH#��?�9�u�e?Ҕ���?�J��VI�?��$W�?��f�v?񩆆[.�?�`}_4�?���X\�@ ��@]�@E��l(X@�"��x@1���@c���n�@� >8G@��g�@�@��L� (@���P�@p����@!�V�E @#����IX@%�6=@(R�=]r$@*�Y��@-��U�@0S�|�wd@1�0̸w�@3���0�@5pQ�C@7_����@9n�5��@;�e"OF@=�����U@@2&��r@A~I2T�@B��Xw+�@DNi�!"D@E�[�=Q4@Gl$";��@I&~��@JڻT���@L�1�|�9@N���i6 @PN�YW�@QZV�:k�@Rp��F@S�a{�x@T�jAB]�@U����@W<��8��@X�]��]@Y�t�4�L@[T+��@\ʻ�s��@^N]���Z@_�F���@`��b���@a��$�a�@bq�@���@cU��rc�        ?��y�S�?���r�?�5�! 23?��n+��?���s_<@�,���@��1v��@y����B@ e����@$s�_r~�@)8�W���@.h/ңn@1���1�@4��xS��@8,��&�@;���>�@?]���@An�t��@CgD����@Ex�;TH@G��mCP5@I��K�
R@LBL��2�@N��i�d�@P��1�<�@R �ұX@Sh��$��@T���V�@Vg�sٖ�@W���]�@Y��z��@[a�.�@]+��L@_��*@`{����@a{���7z@b����3@c�G���@d��h�@e�
�#��@g�=�@hN��	X@i�yT�6@j�xG���@lI5lz�I@m�os��i@o)J.��R@pUu7��p@q<T*�@q����@r�	�ٴ�@s�=�$�@tt��CE@uZ�6j!(@vG�VK�@w9��~�@x3J$�@y3M7�wH@z9���d@{GE̴�@|[O�E֦@}v�yM3@~���N��        ?�:�JP�/@x1�y�@6F�֡��@K�����@Z�	���@f')EOb@p����6@wmUHg@~����@�t=W���@����@�/o��@�X� ���@�O���~@�{x#�[@��c�TM�@�m��(�@�X{Z0|@�er���@�*�P�@�X�
$@��|՞N@�oIp��@�|���@��dw>��@���=�@�E5�4$q@��J��n�@�9�獍�@�ɾ L�\@�h�픉'@���6h@���I&@����m@�AK��rm@�8�	T��@�8?ۚ�%@�?�{>W�@�O���@�g䬁AK@Ƈ���¥@ǰ#����@��X���r@��&�@�X�Z�a@̡]k���@���ǧ�@�Jy膿�@�U�😤@�
O�x@���IQ��@���M�@�@�tD��@�hk�@��; b@՞Za��K@�p�+|�@�GR�t�@�"�-�v@� �*A�@�㶤�k+@�ʄ�16@۵<rp��        ?Gs��TJ�?�v���?����ο?�t�Jӓ2?Ƶג×�?��j3���?�C��=��?�ʜ��T�?�`�Cl?��^4(�?�$@8߶*?����H�c?��lg}=�@3�Sɨ�@/x�P@c�'x[@Ѳ�o;�@y��f+�@�(��@�9�:�@�|/u&�@62X��@��~���@*6;8t5@�24�@!N��"@"��Kj@$G�˼7@%���+��@'�,�WO�@):3schv@+$�-�@,���G@.��g��@0_�Ef@1e�5�@2t�ŭ�	@3���CMA@4���z3@5ԸX~*@7�<|
�@8B,&�2^@9�ˢ��@:Գ�Mu�@<+�EGo�@=�hi#��@>�Sv^A�@@4�CK��@@�1s�@A�9/xk@B�?��e#@CN𝻹{@D#����o@D�ÚWo�@E�bG��p@Fȓr���@G�T��Q�@H��(�@I����q@J�&�s�i@K�k˽��@L�i����@M�+7�<         ?>���G��?{T�P��?�%�Q�|�?�ub8�x?�A�*��?�R��rk?ڌ��?��r��V?�e?�DJ�?�m�7M�?��;m 6P?�L�ҹ?�wǭ�]@�;wN@0����@�$��rB@C&8�H@ 2��,n@G�B@���F��@X,/�@�Т5@�k)�S@�����i@!��G�f�@#S;�>'@%96h�\@'@*�)��@)i��2HL@+�K�	�@.*�C�w@0b��H@1�	����@3:�Ç�l@4�%T��@6jV��@8%-�2.@9��uҪ!@;�j�I@=�,]@@	��[�w@A*���@BZ��9�B@C�R����@D��n��@FI3�E��@G�2����@I:/t�l@J�<�=��@Lp/�Ln�@N&���U@O�l;�O@P��N&��@Q��'�@R�Ke��@S���@U@f�.@V4R]�&@We��ѽ�@X�I�a@Y�_ ��@[AH���@\��        ?��n8��?:�%�KWL?ZõS9�?qQ�ss�?���_ ?�p���?��6�A��?�����P?���L�a?�K���w?�V!;�?��s��'�?�Q����?�ZX���G?��Jw?ڭ�܊4B?�pR���?��G���?�{��=�?��{BVj?򳰍[ӌ?�a8��?����^?�[A����@`+�ء@h�ţ�Z@�7h5�@�+qa��@e��њ@��RG��@H��,A�@AM)�@.4E�@�~(ȯ�@!���K�@#�.^@%?1���1@'�a|��J@*��X�@,��		�@/�JlP�&@1h�upo@3�_Ƈ@4�����@6�`ي��@8�%|��@:���4�+@=G�	I@?�����M@A(ao�h@B�@��@C�� ��@E��O=<@G ͛[F)@H�7���@J����H�@L�#��@N�~�w�,@PKGy^\@Qc�a�Gg@R��I{s@S������@U ���Y        ?�.���o�?�[0�,@���{��@U`P8@,�C��@83�S�@BW|X�@Iܼio�@QN�j�8@VG~/���@[�	+Ü1@`�#,�@dQZ��H�@g�fw@k���0�@p ��4H�@r:�>�~�@t�����@w� �#@yÕ7���@|��i_@�\���@�O-a�X�@��󄠂@��et@�l�N��<@�Iwόk�@�;���@�A���@�^�\�@�H �4�_@�k��n@@������@����+�@�q�{�@�j����@���W�@�-�1LrT@���BK.�@����O@����#�@�B0 �k�@�s&�a��@�K�]��@�*^y��]@�����@��jÄ�w@���.~�@��2��{@��o�x@���[fA@� 
�6��@�9<�WV@�;�����@�hva# @���v��,@��i6��@�� �y�@���-�e@�m�kHs	@�!�k�Aq@��#��̔@���z�        ?S���ָ?�Iړ�ܴ?�Ϛz!;�?��jEvSg?΂��06S?�4%e>Y?�䭓0S?�f"6�d?��;��?�����"?��[�qm@~�7 �<@���K@��(r�@$�J�w@ŒQ���@.�<N��@� hT$@}8�q�@cJ��@sL���%@ ֢��d�@"��LG�@$O�b@@&+�N7@(�*��w@*$�q0�J@,B8���@.v����@0`gA��b@1�x�$�`@2�v��@4�k	[@5mQ�@6�
�5�@8=���E�@9�K�ȏ!@;A�^���@<�{���@>zC���L@@r�0j@@�,�@A����τ@BėxJ@C��Q�i�@D��P��@E�H�ek@F�]	G��@G���]�@H�Ug�Z�@I�7y��@K���_t@L6�@�EL@Md8��@N�5'�Rj@OҘ�Ә�@P���81�@Q-&]�l7@QӺd��@R}Z�S@S)��Z'�@Sٍg.�@T��8        ?Q
���?�ک�1�?��(tc�?��Wi��?��i�w]S?ـ4���8?� j[��?�w��n?���_�?���vh?�}N�I@\@i��ND%@���ײ@����CS@�B\<@����z@)�1`�@�?D��@���d�@�DѪ@��glh@!8����@#&�w�@%;�(!�@'A_��@)���@,j�z@.���}�@0�2�?�@29 ��w�@3��-6�@5�TE�U@7ZS��^@9KHG�Qk@;\�]�@=������@?�6�R�z@A0��	�@B�2�ԭj@C�=e�@Ea�|�g@F�L�@H���E��@JU^8?b@L*�o�p@Nn��R*@P��sQ@Q X��X�@R>EQ���@Si�JF�@T�� X�c@U��_�@WB2��@X�̥̄�@Z���;c@[��c�@]4�]֓@^���{�@`F���vS@a(��|@bhD�@clr�L@d���        ?B�eE��?tx���?�p�S��z?��U1Yf�?��l��?�Z�6�N?̜��G�?��8A�?��)[�t�?�C$�Ͻ!?�����?ꏊ-R�?�#?&x�?��o�)v?�j! )�/?��v,�T?�-[�E��@Q�o<U @®�/�@nR�2�@	X���u�@�ܘ��@�sn�@��'��'@�9���@$�I^�@����p@$q존�@��kS��@ {=H;�@"�\��n@#��X�@%��s@'���l�@)��Va�@,�=�@.y@��2@0��j�F�@1�NU��@3D��Ю@4�R%|k&@6Tl�l��@7��d�G@9��{Vt@;�B����@=j���K@?d��@@��/[~�@A�[���r@B��)��@D�`-9@EEX����@F��?]3�@G̺���K@I �˾,�@J�(�2�@K�{����@M_�J�@N��Wm�@P6:u+��@QͲ��m@Q��@��@R����5(        ?�728�-�?����XL@r�`o��@,�J�r�@;�}I���@F��}���@Q���:r@Wݑ�]Y@_�Eq�ȼ@dU\��=_@iU8��Wz@nڎ4�64@rq��.�f@u�����Y@y;`�[��@|�
k�@��mzJ�P@����D�@��G.��@�9����@��Sl���@�I���`F@�����@��&�	��@�[�R�)@�߮�!0x@�q��{�3@��ŵM @��9b��#@�}j��~@�I� ���@�$�--�@���V	a@��VVu@�	��P.@�Kj�W@�,Y��S�@�I���J@�o<���@���X��v@�ң6FE@�g�P�,@�V��!@���őJ@���D�m@�U�9C��@�]L.�� @�_3�9�@��-�y*@���q7"�@�K�T�I@����3@���֘�K@���ru�7@�t%V�U�@�F��K�@�/b�e@����@��_D���@��W�u�$@��s]�,�@�|���<�@�e���QK        ?QZƝ��?��P�mQ?�߾�H�?�	�h��v?��~��?�$�=AN?��3ӊ�?�9�5��?�"�2i�?���%�$?�4�E��?��|ی�t@�*�$�@ D4Z�@	�1��	@��;b�@:����@�)�@#�nrd@׏u�DM@����(�@�'���@ ��mb�@"��!&��@$ndw\#y@&J�hj�A@(>�Ա��@*I�I��v@,l�����@.�� ��@@0}c�y�8@1��%#я@2�9*@4A��{�@5�T��,�@6��a�@�@8j���Z@9㩑�m6@;g:�an�@<�p/aZ>@>�K���~@@�����@@�	�X�!@A̋�i|x@B�x���I@C�ހVA�@D��J�d�@Eue$QB@Fm��=@Gk����@Ho����@Iy��m((@J��*?��@K�ډvO�@L��w4Y@M�+���@O���CV@P�,-�.@P�D���@QRҊ��>@Q����@R� �W(@S?�?�/        ?@�)��7?}��>}?�h�B��?����<H?��/L��?��2��?��}��?��㜡9R?��k��G?�ͫ[��l?�h0�T�?���l�e@p�$��@?[�?��@
y�]0�@#���m@ �?]h�@�'�!�O@��ŝ��@?|��4@�ն�f4@!NS[A��@#Yݠ<��@%�PX��g@'�S��VS@*Vwt�H+@,�<�g#�@/�ac��@1Rɮ�<@2�p�PE@4y3X��@6*��%�@7�g�~E@9�<� �@;�yɦE@=�ڋ��@?�(��1@A�C�k^@B9|R�c@Cp�S�H�@D��3��@FF��4@Goz	w�@H�顔�T@JiE����@L =Iu��@M�|�`��@Oe��gj@P��N�c@Q�͹w�'@R�^)�Ş@S�͒�9@T�z-6��@U��~k�M@V�_���@X"�kcI�@Ye��j@Z�l��a�@\Y���@]���}f@^��3�@@`AH�;d�@a�I5�2        ?���?QS��CA�?p�Y-$ 7?�z*��6?�\��&�?�[� E�:?��+��#�?� %Åx'?��v��?�Fʨ��8?� �)�E?Ѧ{�e	 ?ֻL&�?��%A�?�-|�[�?條�6�?�퍚��?����?��u�D?��SA��j?��Q��Nx@���y\�@�D�@�10���@���p�I@��,c܃@#=��@������@)	�!�@��w쬍@ F&��m@"h�ߩ$*@$�����@'R�y��[@*"A���@-2�)��@0Dݴ�@@2p�y�@4�����@6/�(��@8~R���@:�(
���@=��4i�@@H9c��
@A�U1���@C�Ħj�7@EL|�5@G6�qI��@IB�Q"n@KrH=�2@M�H)��@P �\F@Qp�{��@RՈT��@TOK(/z@Uޔe�@W��7��Q@Y@	t��@[HzGwB@\�1r��@_0_���@`�Sy���@a�t�'�        ?�a�jCDV?��$�^T@�_Yf@$�]�s�@4b��`�@Ad��q�@I�`�)�@R8��!��@X��H}�@`�H�6�@d> ��@i ����@nJ~�7�@r-��2i@u8t��6@x�n4?"�@|Z��@�)&{:@�Gp��u�@��\��k@���n.�_@�rc��[@�ȡ��h@��z�c@��y0�?�@�v�0R�@��}�W@��x.���@��!e���@�[�C�0@�D�O�(@�?�f�"�@�M]�H^@��8�X?�@��=c�Z�@��x>h��@����}@�F�
�$@�~�-#�|@��P��Z�@���ݾ�@�T� +
�@�����e@�
��A@�q���-�@�����	@����2�?@�kJB�@6@�.�%��H@��o��l�@�� �e�:@���X��@�e���"�@�=��h�@��}41�@����w@�ݲX�q�@���	��@��LD<p@����y�0@������@�����=#@���r�@        ?5(����[?i�G�?��H&VM�?���v��?�wH����?�G�&[B?��v�_�?�B��/�?��I@ؕA?�v���'?ڴ�K��V?�?�vjX??�j��2w?��=c��?�ƯUu8?�NS��?�c̥r�?��ˣ?��1W��?���3�?�O*���<?�)X��@ �؊�E�@(s7��@�R��F@�|Vts@W����@	8K]�@,��F��@5F��h)@Q��/@�8?8��@�~i�@l�"Ÿ@G`P��@�����@��֮�K@)L�^u'@����W@����/@d�+P:@᤯��{@gĺ>`�@ {���A@!G�h�0@"�8��@"���դj@#ǗB[��@$��t�#@%��Dkn�@&nJP0�@'Y�@�+@(G���~@);M���@*2N�uX�@+-Ҍ�m�@,-�QEf4@-1�a48�@.:�@�@/H4p��@0-*:Y <@0�ۈ�R�@1G*��        ? ��28?9��8��?]΃�ڟ?u�H�:?�ۼ�,��?��&��?��Q���~?�${=�g?��w߸%y?�E�[��?�p��F�?��lb��?�..�)?�:��n,�?�U� �?�ц��e�?�$R.&H?�5�aB�?��Ma�l-?��	/�v%?���9n�??�?�9-�@ ��2�Xp@f�º��@��u&l@	�5sAV�@�p���@��4@:^���@�Pnʰ@a����@GB��t;@e�����@ �n�X@"�L���@$�\�l��@&��g�L@(���E�@+y@-�=���@0��^�@1jX|�hS@2����@4]7baJ�@5�G�	@7��Q��@9a�,V�@@;8�j-N@=%�_�@?)���u@@��'��@A���=@B��$��@D���'@ES���*@F��/��A@G�\ �@I^��cB@Jұ���R@LT�Q���@M�D%�@O����@P��Y��        ?#�Ե��?VH��?u�%v�V�?�t;��3�?�v#�~c?���Ǭ!
?��!LU��?�*�6?G�?���a(Hf?ɝI���?���� 4�?՞�II&?�O�,͓�?��֠�\.?��D/J?�n�?��/ck�?�Rk��cO?��1R��?��l7|N�?�;�N�b@}���@D��fI@_d��C�@
�=x3��@�_y3@t�GL�]@�z��b@`�9�k@6�P�@P�k�%@�͞�@!��X���@#�%p�V@%��U�@(J6Ca;�@*��M�@-�p �@0RÞ�X@1��p@3���O	@5�s^�O�@7�8�&��@9�~�qe@;���مI@>e-��Û@@}��P@A�J�^I@CR��
@D��,��@F}��_��@H6Y����@J�K���@K�Jb�@M� ���?@P[;e�@Q!R��A�@RI��4!@S�p��y@T�08�QW@V��9��@Ww��S��@X�J�        ?�Jk�9�?������?����ɐ�@ ��m}�@���v�@
�����@#V�NԳN@*���v�@1������@6�J�R@;�B#��@@���Vd@D3)z@G���H@K::l�q@O0�G�@Q��l5�@S�S�_2@VT���%�@X�GY;��@[�?�]�@^OJ��2�@`��v���@b+���Q@cɘ�pZ@ey�9��e@g<�c((�@i��]Z@j�g�x;a@l�K�6�@o

��"@p�1�	@q�Bc��G@r�v*z@t3MA�@uI��킸@v�c�S�@w��*6@y=�j��|@z��~ij�@|m6�V7@}�:V��@1���@�Q���GI@�#���@��k��g@���%�@��H��-@��j�\��@�f`��ĳ@�P!���'@�>�"D9@�1ގ�#@�)�sy�E@�&g��@�'����@�-����@�8�*��@�I	Y�@�^y^u�@�<��e@���g�c@�`q<Ŵ9